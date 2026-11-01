Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565220;
	b=lutrPvYW1JL4hLCs7MFma5bjF0ZBz638g+T/29/6yrwC1ljRMunynPRnj6U/CH0NOXdC
	 +T4omB1wCav5Tr3tIGDicgldTJ+cgn6+R9Z7ghnzXD+VoM6Y/hWX2b9ghH/WPVQpvyBcJ
	 D6pNkTfdiIcEZ19G67Fr1gk9B00yJ+i3p2ZBxkoAbgabrykD6IxvCQSn9WlROEIyknZM7
	 or0kBk5q/jIJki5Zg2jAQd8PBX7df0Uw8LryluQDDf4yrIHeLoYrBNh++IgJsU/VNiKcN
	 BEx/rMo4dRvnbMQ9rRnBo8bw4+D1gjLYz9csqmI21ZkELlmbW00mG1w+i4NIc+ci2VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
	b=x8KJBzE/9PNuK0wdv7yujDq9uJoH9AlrinxhX91kope9gFsPjFJ2mVsGPNaZFCVkurlU
	 gj9YmthraYjLUvCew44WvtkPheIKL2ejDxUfc/72qKn9LcZwaFtiUDwgMYpyuh7GJQ2l6
	 UZSvHEKxPkgaBqNpu6B4oSCdrM+74Rye2fRzjsvJWEliCLFI490kjVnu5juhdQvJT0UQG
	 bR7SARuxk8sMXL21OSouWq/ilRuXMI1mYThmF8MqO1zRO1yD/iX4gZ6NSevXA1fwHaCZA
	 cYHTllEbsdja4m6VTzObYl97YE844HBt6EqhOJjSPkgdAq2ILyfBsBya1YRh5L+e6dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayog8F7b;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB478606A333
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Nov 2026 20:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB478606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayog8F7b
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1273843f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Nov 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565218; x=1794170018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=ayog8F7btGJw3CNz6kgKA8+sVNDA+NnGnPEfc810MDYFO0PB2M0aH1Va3F/sLTAJdh
         Z+szfMjRiXOAfYMPZNNYeTTXxtx8agH0gaXFjZMMsRnf10OdHiHCXDKRAtLfjV33te3r
         Rf00tPhy0qk3mAry5jD/hU95RmW8NcXn6oFqj58hWevURv6/RNN0K8NjyIyKZUwi+mGH
         OEhDSCxu/p0Cgic778mz02C2U3Wkxu1FBa35Wd5X4lZeymbzrWPIHXcxqjcC8Q34pRyu
         HszuTeylISSjJoh7k5a61cMiqM6KQ8YmSUkgKlZvqQvQ8hoaeZv6iYi6WA4Hc6cP4Z77
         seXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565218; x=1794170018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=h75q1ANDinjw+z6DKTAk/G8A8ltDjxc4f8aoL7hBW4bvMPVd5TiU8FSYLL4SX4snWx
         gzrbGCmQzbbInt5Hz648dXFOdrPHeGEtcvon99lXRaijT9dA8vdJ4ssYL51rll2Vsbr9
         0fGS4qLi0ZhGwUxdB2BHw9DgWRF9m8EO3GSdPbPaz1uYB7G+gYpxKWF2KhG7LRXxIWAR
         uRVMxbAVxWLQKD+J8ghpxTC4fzPTu+uE9Zt2IIsJ1OXoXlWBJ2GpZp8ARtOW66A8vwrT
         CpAd+9lx42rci6+NhB8BcMGlJ+hwzRKUwKgVrnIYG6cOyfcBaRIw+ll/ocdqRjCXZ3Og
         +JxA==
X-Forwarded-Encrypted: i=1; AKwUvBy9a143ZYwI67rzhDJGgmuOb0fDGAX6lza1vg6E1vDBGxF/FgyleMkeE8sa4YZGq0Q9xmlZh8e4DuQ4Ag==@lists.linux.dev
X-Gm-Message-State: APuU4Z+WjyysAirCNgljmINv04NOh8hAyabMz1uDm3il5SiQE7Ch4wiy
	jvTa+jRWMLgY7Ag4rADvIv+KK9Cz6nDN/TG8cZGKHxqjVLSxcdyPf6L1
X-Gm-Gg: AYBFou20sS2gasJZIqdM53+1egfdfAU3tb3HAkWTg96bHM0qIUyh/VGAAUB698PJDz0
	Agch1ImY/fRih5rbgv5cYJQ5cJ2p/T6WObkh4zUGz4HqChGHfHxxJdYN0zqhnOecQmZk3zdM1jN
	OmAD79XB38UXraKmDsiBLBIOy6fM5quelVy/VMbdyJ1lCDaUwYSrS+zQp+AK+mh0+ZvixQ0a2uu
	qOTOHcaUtBfsZ42QOYCcqYMb4GV273RgLvwNmj76RZR0XB7iv6DciG5Rc61pK4+LqKuTkQMhnV4
	iR5IqALN9Py0LqhSOIuhVkkkopWNsGgIk4ZaLmWj+heXw7+uHPzu8saMvQemXy4olAfICXJQljy
	Iw7HAZS+dzHx6WC2HVt5c34EOo2XWMfhJJ++GWcgULm0X70H/aeIpJm4CbEh0lzOv99UvLKbNhJ
	V35ri+x9b5obtlktwY4BAuVGZb2z+JFqTOw+N7luzuVcLzbw7OOgXkyYl1l/N95Y7kHfNU0ERuf
	tan+qsa+qWv5I1VnYpLjA16QcabU6t2uO+D0a5eXacO+26zPk1owkq1FwTUSJn0XNDa3ZjMOq3L
	zvXbcyQ0XKs3lZdR73GxWRJHWP8O37MP6XmvIYRPtyGfrdOmQUdwz6fO7l9gOtrK2qY6lOf1ktW
	QQHSZmL2b7TAuFbpCTb+GANri/bFdQKGGgY7grwY18B6qNM4mZFj1Motp0tcTfru8Ag==
X-Received: by 2002:a05:6000:310c:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-48e6e2fbc14mr20001368f8f.42.1793565218073;
        Sun, 01 Nov 2026 12:33:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm18722895f8f.3.2026.11.01.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:33:37 -0800 (PST)
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
Subject: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun,  1 Nov 2026 21:33:36 +0100
Message-ID: <20261101203336.1360239-1-romain.tisserand@gmail.com>
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

The N-K-M rate code computes parent * n * k / m in an unsigned long,
which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.

On the A33, pll-mipi (parent pll-video at 297 MHz) with N = 14, K = 2,
M = 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
picks these factors for a 288 MHz request, and clk_get_rate() reports
287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
594 Mbit/s instead of 288 and the picture broke up.

Do the multiplications in 64 bits, saturating at ULONG_MAX, in
ccu_nkm_recalc_rate(), in both best-rate searches, and for the parent
rate request of the parent-adjusting search, where rate * m overflows
the same way.

Without the saturation, a candidate above 4.29 GHz in the search would
be truncated again on return and could look like a valid low rate.

64-bit kernels are not affected. On 32-bit ones, every N-K-M clock can
hit it (A31, A23, A33, R40, H3, V3s and F1C100s use them), whenever the
parent rate times N * K goes above 2^32.

Fixes: df6561e60244 ("clk: sunxi-ng: Add N-K-M Factor clock")
Fixes: 3492e4f6db5f ("clk: sunxi-ng: nkm: consider alternative parent rates when determining rate")
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31, A23,
  A33, R40 and H3 CCUs) and arm64 (defconfig), SUNXI_CCU=y and =m, no
  warnings; on arm the 64-bit divisions go through __do_div64 (no libgcc
  helper). Tested on a PocketGo S30 (A33) running 6.18.54 with this
  change, without the ULONG_MAX saturation (same results for rates that
  fit, which is the only case the hardware hits): before, pll-mipi was
  programmed with N = 14, K = 2, M = 14 (594 MHz measured as a 2x lane
  rate) while clk_get_rate() returned 287216621; after, N = 15, K = 1,
  M = 16, 278437500 Hz in both the register and clk_get_rate(), and the
  panel picture is right. This version, with the saturation, then on
  the same board on 7.3.1: pll-mipi again programmed with N = 15, K = 1,
  M = 16 (278.4 MHz from the 297 MHz pll-video0) and the picture is
  right. Not tested on the other SoCs.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to bring up the PocketGo S30 display. It found the mismatch
  between the pll-mipi register and the rate the clock framework
  reported, traced it to this overflow and drafted the fix and the
  message. I reviewed and understand the change and tested it as
  described above.

 drivers/clk/sunxi-ng/ccu_nkm.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 401fbb7524..e5a8f22d50 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 
 #include "ccu_gate.h"
 #include "ccu_nkm.h"
@@ -30,6 +31,26 @@ static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned long paren
 	return true;
 }
 
+static unsigned long ccu_nkm_calc_rate(unsigned long parent,
+				       unsigned long n, unsigned long k,
+				       unsigned long m)
+{
+	u64 rate = (u64)parent * n * k;
+
+	do_div(rate, m);
+	return min_t(u64, rate, ULONG_MAX);
+}
+
+static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
+					      unsigned long n, unsigned long k,
+					      unsigned long m)
+{
+	u64 parent = (u64)rate * m;
+
+	do_div(parent, n * k);
+	return min_t(u64, parent, ULONG_MAX);
+}
+
 static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
 						       struct clk_hw *parent_hw,
 						       unsigned long *parent, unsigned long rate,
@@ -44,12 +65,13 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
 				unsigned long tmp_rate, tmp_parent;
 
-				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
+				tmp_parent = ccu_nkm_calc_parent_rate(rate, _n, _k, _m);
+				tmp_parent = clk_hw_round_rate(parent_hw, tmp_parent);
 
 				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
 					continue;
 
-				tmp_rate = tmp_parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(tmp_parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
 				    (tmp_parent == *parent && tmp_rate == best_rate)) {
@@ -87,7 +109,7 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 
 				unsigned long tmp_rate;
 
-				tmp_rate = parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
 					best_rate = tmp_rate;
@@ -154,7 +176,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 	if (!m)
 		m++;
 
-	rate = parent_rate * n  * k / m;
+	rate = ccu_nkm_calc_rate(parent_rate, n, k, m);
 
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= nkm->fixed_post_div;

base-commit: 5243bd55dfe63a5f806622878f6fbdd78172fac9
-- 
2.43.0

