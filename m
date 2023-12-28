Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA22A101E1
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Dec 2023 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="R7xB1Cre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703792376; x=1704397176; i=wahrenst@gmx.net;
	bh=O5ulGC/E+pkbJaH3m3FickjdmSA72Lqn3/s8w/8jwD8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=R7xB1Creaf/m5vUFWuAv0q8ULOFXcU7Vx/rnpwHrC048R62sKJpcNYSKxLM4OXf+
	 maLDIrb8Il+aXUlMHeomZzT9bJ3WJO1Qsb47U+3vPn4AsHP2elC9MYwqIVzUUs5RC
	 6Gmeks8gcMn+MDpO7lcvr9BigI/RBS8QEYjNBZFmX0tX5u1LwJe6AX70bejvCX25T
	 jRbQv4TKtjHbgNhpIlPevGXdb8jeerLonZzuoqrcle9VTN+7q1CicYwZIZwsFoUKN
	 gM7snvQChjzzOAtIXMTcPgSovdUsDCGN+W9lJt9Ya0PH5rspnvyg8MLyaMvatxUPM
	 FfM2CFDhtDC+/dCVjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAcs-1qhOUJ452O-00bbWi; Thu, 28
 Dec 2023 20:39:36 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>,
	linux-sunxi@lists.linux.dev,
	soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 1/2] ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
Date: Thu, 28 Dec 2023 20:39:02 +0100
Message-Id: <20231228193903.9078-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QXumkr2GEgs4aBLmHE2c+e2mWHTCzqDtFafwQoth9VRlL7aNXdn
 J5GrPmdE5T31zLLWMBDHIIJN8SEhd3LkKf/e2e50TWGyAn8yulMA9H40atnRF9PZutkn1lK
 J05QSgRiX5LSlghBC0QXdq7kJM5xpE7mICuLPiqm8FNvdIuiOpAxGnMxWWF8eb9eWKFOmQR
 2w1Gw8v5hCxt56h3r+7cQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F2lq3oHs+1Y=;G3LbDeFTbXDRBFDi8EPrFbtFZjv
 HWrUMfhbm3uGyzEck+hp+uS7o+GfB48UIRTLJ0aCx0HVjsDXxAMdvbys768NLI+xUh4Ln504e
 /OLmvK8Qtx3oDLm6rzHb7bsk3ZqIoM2fygj01FXKAjCZByWbHxQEn1OMsWCjUvMJQEYys+fBc
 VWl6MjyQ+pnrB2GpaxZnmrs6N6gJbQWHiH7mvrA1IImNyHWWhtYR3PxGwnFKeqZrIq2P+vKsM
 sAz7bBa4lS+G+GhVhNDSQKEW/KKFpepwm9gBa8D6637qzWhjHhi7yUwS6UywWlqNZCip/vZSZ
 FAKMbTd9rlPD0GNemOrZSKzlNBXHQO4PQs3cvSGjzGh70BFNcWVOcy3YdsrBIJpZbEFaZT4Ev
 WfWkh5AavrULPDJMhvfFFeYVpdo16QIUeWW13Zp6a9XrY6a7hj5IlSie+/xVZ20+Mn7Dv019o
 TrLMH73DLjpFv7mHvJdKO1BQw9+PAkOupnIxPPLYxKxpPPXFH6VPhG35guyO7A4hhAgGaekY+
 MYgoz8hD5CzmSPCoNnM8HaJ2ANzftZS/zamGFZKzEmM6WIrYddKF75jjbwqqRaf+UaP2+K7iG
 zvznHqfVIHaWlfb3pW+UciujcU+c+M3l8HrGTGTyRSsvBqgotTayfC1nQ1eUaCsAQ5t9XxEaQ
 TmjF68tJEEu+rpbAh/ETLIIlnSXIpbIKd5Ai2tKRMG/Dg7X5d1sC2qgqJMP9OAHxm3BV35yzC
 m8ZQlqR49e5wNvxrz0GgIJTyfJIdK/GMeM91k8vhzDzifBN60MEVDLBDFP1Kt25OWLc0CmkJz
 D8SnW/75844RJWIdqXcDCLj0tszve0yHEhcSDewa2CuNA/7bxepxEVKxlIsBftx4mkRWlha9d
 50gbpgqnFlIZsWztl5ZIB/OoDh0TWO6Bi9Gt4LB+vPUDKKvg/2/jnCWeZuiOxDtFvGtWdDVDt
 kGIgce/CW4/4qEMJ6pmjkawvnh6HPRS6i8QMHsQ6lBlhcrQD

Running a multi-arch kernel (multi_v7_defconfig) on a Raspberry Pi 3B+
with enabled CONFIG_UBSAN triggers the following warning:

 UBSAN: array-index-out-of-bounds in arch/arm/mach-sunxi/mc_smp.c:810:29
 index 2 is out of range for type 'sunxi_mc_smp_data [2]'
 CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc6-00248-g5254c0cbc92d
 Hardware name: BCM2835
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x40/0x4c
  dump_stack_lvl from ubsan_epilogue+0x8/0x34
  ubsan_epilogue from __ubsan_handle_out_of_bounds+0x78/0x80
  __ubsan_handle_out_of_bounds from sunxi_mc_smp_init+0xe4/0x4cc
  sunxi_mc_smp_init from do_one_initcall+0xa0/0x2fc
  do_one_initcall from kernel_init_freeable+0xf4/0x2f4
  kernel_init_freeable from kernel_init+0x18/0x158
  kernel_init from ret_from_fork+0x14/0x28

Since the enabled method couldn't match with any entry from
sunxi_mc_smp_data, the value of the index shouldn't be used right after
the loop. So move it after the check of ret in order to have a valid
index.

Fixes: 1631090e34f5 ("ARM: sun9i: smp: Add is_a83t field")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
Changes in V2:
- append another patch to fix return code check

 arch/arm/mach-sunxi/mc_smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
index cb63921232a6..6ec3445f3c72 100644
=2D-- a/arch/arm/mach-sunxi/mc_smp.c
+++ b/arch/arm/mach-sunxi/mc_smp.c
@@ -807,12 +807,12 @@ static int __init sunxi_mc_smp_init(void)
 			break;
 	}

-	is_a83t =3D sunxi_mc_smp_data[i].is_a83t;
-
 	of_node_put(node);
 	if (ret)
 		return -ENODEV;

+	is_a83t =3D sunxi_mc_smp_data[i].is_a83t;
+
 	if (!sunxi_mc_smp_cpu_table_init())
 		return -EINVAL;

=2D-
2.34.1

