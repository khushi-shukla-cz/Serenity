import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/services/firebase_auth_service.dart';

class DebugGoogleSignIn extends StatefulWidget {
  const DebugGoogleSignIn({super.key});

  @override
  State<DebugGoogleSignIn> createState() => _DebugGoogleSignInState();
}

class _DebugGoogleSignInState extends State<DebugGoogleSignIn> {
  final _authService = FirebaseAuthService();
  final _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    // Add Web Client ID for web platform support
    clientId: '625175170053-8hkj7fj554kbrp485dod3prog4l6c2b4.apps.googleusercontent.com',
  );
  
  String _status = 'Ready to test';
  bool _isLoading = false;
  final List<String> _logs = [];

  void _addLog(String message) {
    setState(() {
      _logs.add('${DateTime.now().toString().substring(11, 19)} - $message');
    });
  }

  Future<void> _testGoogleSignIn() async {
    setState(() {
      _isLoading = true;
      _status = 'Testing Google Sign-In...';
      _logs.clear();
    });

    try {
      _addLog('Starting Google Sign-In test');
      
      // Step 1: Check if Google Sign-In is available
      _addLog('Checking Google Play Services...');
      final isAvailable = await _googleSignIn.isSignedIn();
      _addLog('Already signed in: $isAvailable');
      
      if (isAvailable) {
        _addLog('Signing out first...');
        await _googleSignIn.signOut();
        _addLog('Signed out successfully');
      }

      // Step 2: Attempt sign in
      _addLog('Initiating Google Sign-In...');
      final googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        _addLog('❌ User cancelled sign-in');
        setState(() {
          _status = 'User cancelled';
          _isLoading = false;
        });
        return;
      }

      _addLog('✓ Google user obtained');
      _addLog('Email: ${googleUser.email}');
      _addLog('Display Name: ${googleUser.displayName}');

      // Step 3: Get authentication
      _addLog('Getting authentication details...');
      final googleAuth = await googleUser.authentication;
      _addLog('✓ Got authentication');
      _addLog('Access Token: ${googleAuth.accessToken?.substring(0, 20)}...');
      _addLog('ID Token: ${googleAuth.idToken?.substring(0, 20)}...');

      // Step 4: Sign in to Firebase
      _addLog('Signing in to Firebase...');
      final userCredential = await _authService.signInWithGoogle();
      
      if (userCredential != null) {
        _addLog('✅ Firebase sign-in successful!');
        _addLog('User ID: ${userCredential.user?.uid}');
        _addLog('Email: ${userCredential.user?.email}');
        setState(() {
          _status = '✅ Success!';
        });
      } else {
        _addLog('❌ Firebase returned null');
        setState(() {
          _status = 'Failed: null response';
        });
      }
    } catch (e) {
      _addLog('❌ ERROR: $e');
      setState(() {
        _status = 'Failed: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _checkConfiguration() async {
    setState(_logs.clear);

    _addLog('=== Configuration Check ===');
    
    try {
      final googleSignIn = GoogleSignIn(scopes: ['email']);
      _addLog('✓ GoogleSignIn initialized');
      
      final isSignedIn = await googleSignIn.isSignedIn();
      _addLog('Currently signed in: $isSignedIn');
      
      if (isSignedIn) {
        final currentUser = await googleSignIn.signInSilently();
        if (currentUser != null) {
          _addLog('Current user: ${currentUser.email}');
        }
      }
      
      _addLog('✓ Configuration seems OK');
    } catch (e) {
      _addLog('❌ Configuration error: $e');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Debug Google Sign-In'),
        backgroundColor: const Color(0xFF40C4C4),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Status Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _status,
                      style: TextStyle(
                        fontSize: 14,
                        color: _status.contains('Success') 
                            ? Colors.green 
                            : _status.contains('Failed') 
                                ? Colors.red 
                                : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _testGoogleSignIn,
                      icon: _isLoading 
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Icon(Icons.play_arrow),
                      label: const Text('Test Sign-In'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4285F4),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _checkConfiguration,
                      icon: const Icon(Icons.settings),
                      label: const Text('Check Config'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF40C4C4),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Logs
              const Text(
                'Logs:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _logs.isEmpty
                      ? const Center(
                          child: Text(
                            'No logs yet. Press "Test Sign-In" to start.',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _logs.length,
                          itemBuilder: (context, index) {
                            final log = _logs[index];
                            Color logColor = Colors.white;
                            if (log.contains('✓') || log.contains('✅')) {
                              logColor = Colors.greenAccent;
                            } else if (log.contains('❌')) {
                              logColor = Colors.redAccent;
                            }
                            
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                log,
                                style: TextStyle(
                                  color: logColor,
                                  fontSize: 12,
                                  fontFamily: 'monospace',
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Instructions
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue[700], size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Setup Requirements:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1. Add SHA-1 to Firebase Console\n'
                      '2. Download new google-services.json\n'
                      '3. Enable Google Sign-In in Authentication\n'
                      '4. Restart the app completely',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
