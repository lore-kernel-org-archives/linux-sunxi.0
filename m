Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018961;
	b=VuhP0dPTuFso/13bixp3EJvviD+IfDDXtu9RUY2HdH8BSbye07TFfaKqcg+BUlCEWQCq
	 54MFpqOPWG+2uwz1rbA2oSQU20lR6t6uMEKKPPH/F2Bc7J/CMIBmrcai/Lle+EtkRC432
	 Px02s+NIoEoEwsSKT2fQItlXsWwHWZEWX18WAeWFwOghSDix3anPYp8uQYo49HVpKc5S5
	 rz9VqQ+q8AUILn0R7tWnu/WEC3xV44jAQ2c9s3IIybxaNW/g3bC7/8NBLLbutja/W8hJs
	 90s7N4Gr5b/xsBZyPCkyF/Wdf5ctGFJhmSECauvOQ3+aRIy3ltzBFV48yMlzjJ6YN4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
	b=ZIlXYfn7KglrYBIsLPcPD5OYdTHiry+MdO6VCtff272xjvkODm9TgOQrvC0wC8HeanpR
	 eNZ8cE3U+AUPrz0jWI3s9tiBX7xOVuyjUM0n/S15c+hme9R6+VlvyMJo7/aN4vJKQHGZw
	 U3h8U9LPXxhzUCgTEpJr27EZfQjUJTRL62eABNi30XFdAtbB0qeNa50DDey8lyL/oofAj
	 1LR9qQpP2xpFdbbukdPQk/0G7/nq44aiAYPE5+n7s3LAGMa7gXJRlYsaE5TPlS9ouSuQz
	 eaGn9ppOQ4waGoVxg9ZuKeAI9BXnrUiUldn6xBR84tItl6xFMdbfh7QXRHFmX1+HVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svhHM7Xz;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22198606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 16:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22198606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svhHM7Xz
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so538201f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018959; x=1795623759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=svhHM7XzpxTDo05DvdnGKkJ04H3d4T1WNbMnN2TDcmzh92iWDOYBAuqvb29E2DCOqy
         hM8gYp9DDAwCkuTRzyq9/PQWpQSTlZdZRh/Je0LEMlehuBU8T0V4rhnXSErcH9ovrU6B
         HDKBzPYr6VBANED6+BH6qw7eyXxDqYh8UWG3DZ5rSsWy9GjaID3xysEmirVOyGE+qLlN
         3M72uAuCMaYO0avWmz0m7UfrkM19i/r7W4fFB9AnkCqMFaVt6KpAJ8AetcU76BUCIlsJ
         /eBApvw6+tSuVhJEl46JjjuYyqQM7bm4mIfGEiZOkKVll7sBnnKenS3xb+Mki80WYgZ1
         tLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018959; x=1795623759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=EGV7bH29uqlcCJtH1EQYjlLo1V1NGc6v9iyd55X99E83ZxwkJM5k+yqAiFvyp3MFM4
         sTVxyEUxUtHUkYB2lRqv+oqWMJFethQhJkriKvYztD8zal7EyR6DVA9NKoXeVohedjY7
         v1G91VMJ/DXhCUPThp1dSvrKWBi4D74Aw+uPoLMPFZP5CtMGa4B84YyH1wIcjGp4mLDa
         aUDq9CK0KNu02PW2XWdQPDDJ8eVo1XHHzlJleBKGp6BG6vbSk9qlMvsOVk8P8FuShhEZ
         dGZBhc8E+WoMGG8uOXL6vrrRCpiGbRklQnoprdJUyb/hJEQ+WaQYRS7V635keHrBrJOk
         AVwA==
X-Forwarded-Encrypted: i=1; AL+hErHfGK9GA1fAFRPCr79rxjSsutKotPAkRf4RsKS0PSwDV5s8vcoShFpnaDXoBJ/qMG5ajmdPrxuiCpjjzA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8+j5ioE0jEeyEAj3ViaHJ8uFcicc9azPKgVZjZCPG9X/GZIP9o
	eyCu3qe28nam2S3+BD6fjZd7T30U7dY47RltKBY175ftMkXsIzZiDiYB
X-Gm-Gg: AZFdTZef5VUrzCNb5XVgv7YxORNPW63KtkNMUT2ZhdCc8ekNYY1O54ShD1hCicxHg6T
	THGR6ZT3Zbl8M3W4m2Q+GUxs1hpxMZAy1xPuakXHGOTja1/h7mnp5g/TvGPmjgfrbhEXsIdJ5nV
	BnaCjke8yKpAnIG8CpIgEbhJTLFJwPJAb5cj2o6il3rn+pVAFhHbogQ/ex4p5srOZ24u2ioLaD0
	h9IogoyXnoxM0FwzEv6kevRN2YGt9cMdChgP6KzO4jNj+Pz3ZaASicBjG05d4G79XXp/EOGOe1l
	iluH9yfEAq0CGCuQQOwn0EgJXY0Hm++rpEWKYJD2n9G5ngiOCw9csF22atUwi8EJCvN5xXykNWV
	Fq6WZMWQFsd83DEkf9PqhIKYXamC57X8Qnlf3JymF43spL1TkOveSSOZI+kz4Gv4mh9Pik2VTAu
	lf3emua2POVVQ05l4EUAKQ87zYHA7L/pbgoW7HKJhDW4u7tk23B4gaH80Xm313WTBPbeObZhqKT
	NNxc6cmtJCutW3mfl29wTHXJKt0CEk2UR+qXdGVUfKEUnepNYekaA224UVGd+52/5oYViWdFGvH
	lW7jzL0RdVrn3hJ/hNWv6wnVbQX2QpuzicKj/Mrxz1DhRP6hputKmrI6pzfT6S0ktk93TnYRVZ2
	UBZWSDrlAQWiMMwKs9MHQaqRbORTt3/k=
X-Received: by 2002:a5d:6f0f:0:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-4a63c65829bmr5664866f8f.18.1795018959207;
        Wed, 18 Nov 2026 08:22:39 -0800 (PST)
Received: from localhost.localdomain ([2001:861:39c2:e340:26a9:c0e4:d23b:6722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5780458f8f.36.2026.11.18.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:22:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: nkm: use div64_ul() for the rate divisions
Date: Wed, 18 Nov 2026 17:22:37 +0100
Message-ID: <20261118162237.1664352-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccu_nkm_calc_rate() and ccu_nkm_calc_parent_rate() divide their 64-bit
products by an unsigned long (m, n * k) with do_div(), whose divisor is
32 bits: on 64-bit it would be truncated. The N, K and M factors keep
it far below 2^32, so the results do not change, but use div64_ul(),
which takes an unsigned long divisor, as coccinelle suggests. On 32-bit
it is the same do_div() as before.

Fixes: e9d9dae0d248 ("clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611151822.QXTOs54d-lkp@intel.com/
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Follow-up to e9d9dae0d248 in sunxi/clk-for-7.5, for the coccinelle
  report of the kernel test robot (do_div() with an unsigned long
  divisor); squash it into that commit if you prefer.
- No functional change: m and n * k stay far below 2^32 for every NKM
  clock, so do_div() never saw a truncated divisor.
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31 and
  A33 CCUs) and arm64 (defconfig), no warnings; on arm the divisions
  still go through __do_div64 (no __aeabi_uldivmod). Not run on
  hardware: the generated code for the rates the hardware uses is the
  same division as before.
- Tool disclosure: prepared with Claude Opus 5.5 (Anthropic) as a coding
  assistant, from the robot report; I reviewed and understand the change.

 drivers/clk/sunxi-ng/ccu_nkm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index e5a8f22d50f5..a11d51dd0f2a 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -35,9 +35,8 @@ static unsigned long ccu_nkm_calc_rate(unsigned long parent,
 				       unsigned long n, unsigned long k,
 				       unsigned long m)
 {
-	u64 rate = (u64)parent * n * k;
+	u64 rate = div64_ul((u64)parent * n * k, m);
 
-	do_div(rate, m);
 	return min_t(u64, rate, ULONG_MAX);
 }
 
@@ -45,9 +44,8 @@ static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
 					      unsigned long n, unsigned long k,
 					      unsigned long m)
 {
-	u64 parent = (u64)rate * m;
+	u64 parent = div64_ul((u64)rate * m, n * k);
 
-	do_div(parent, n * k);
 	return min_t(u64, parent, ULONG_MAX);
 }
 

base-commit: 3f8438336a3b340ffbda9e89480630436423782d
-- 
2.43.0

