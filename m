Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E516D264
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Dec 2023 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="hinBr81f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703334972; x=1703939772; i=wahrenst@gmx.net;
	bh=JncPf9nLdRLwEx36h3QEDk4/crDt/APzy8lf02Z8TQw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=hinBr81f0IvByakeNxCYzE1O4QipIv+zRyT0kLjhOslFtlHv5bh1YwMCD8mkUmET
	 /PmZGlZoJ9if3gEglWofUbHlk14WXjV0OJ/Bj+G2G0vViv+paHH5Dx0C/oHW+m3z2
	 /zQTiDPhikQ/rB/3v3e1dfr49tIGvw9/shDxU8orFmSQqPsY+TQVHC3Kk/kkfGj7S
	 o4Y8UcPLmDeNnIcx3KwC0G/a6ugudIUf8AcjxLvWDx67KtkP5iI+raMRuuKq2fMjA
	 ztvzDHbdCoHUW4kJp99SIl9jzaiZny3MeGeeXTVd+gpZlJxeJoXfrQ27YwECfXPbR
	 U2WLIfatUzznQDSpCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1qzUU90pCD-00rKnD; Sat, 23
 Dec 2023 13:36:12 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>,
	linux-sunxi@lists.linux.dev,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
Date: Sat, 23 Dec 2023 13:35:46 +0100
Message-Id: <20231223123546.88125-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sZWTjmyHvO3Pwx9sSZDiG/Y9Hvhu5VgjYKLEdc7HJpuvZcoVwqq
 gEu0rPOAqmDAEjVM/679zu2losBRdkPeYk21Fymq/2Dvtpx6YYP7IoYccQgcn1Lw6JqYs0Z
 ZUpyCtzIZYE3khgqgj6xhmrtzvleGMIL3tD9jjKiO8uqS2+/hbsveCcL//ijsraX326cSbn
 g8+C+9K5Cm4LXwbF5lGOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6IlSc1pTTNo=;mt8A1lHede827k8Qu5kuBxmJF7h
 NY+vjrvcGkfNl4OF7gp0B9FucfJr9WcjivQghrokqNH+pLVa74MIg1HPDAgerVy7zO7uo+Qbl
 NkeNEV+/5M4kMuPQlNFwQD2AtdbyHTKhxF7KI5EaLCwDbrUvMpuy6pr5wfJcEecRBbk5Kg1CQ
 iSaUsTBqAPKXXS0dZDxr/Jy4ElEEn9qZI2AnNCAXXUuAnaM2l6lnUVuMvTNXop60jnBffo8zj
 NpzcvO64v5au3ac36MYTAQQpy/V9btAsYCKdJRd58b1ibG6Yd7RSROa31JTyUhuf1YxdfWgWC
 9llucUx8RyhM001tARtl4YrK7Tw/bJb0mc69lgJ7R25qebFXI6sZSOln5wwHd0idMLtL0Tvoh
 TAOs+AtRGOVkySR64mB+1ajLoBjWjSEIvu62Empg0+BYz81VqzNZZ/M5DFCGR4XangXCz1QZV
 ClX5jC23Egml8pX4E7iCSwYEIzd5XfC6qq/lhKEYdInGPW5Z/F8x8bTi7XBJKP8L/YGn7BWli
 uEScNTe4E12qbgf0Rp8ULAxdG6GsKTiOua8yK/6P8X6NTVomje7SrxEtoZtc3SrG31utqw4jh
 MaNhKeGkykDZBVQkKnBoVrt+a229T6olYW/qFFop2zNDu2liOCFe8a1aBSdlTXKOwui56goqD
 IDw2sYwsHSsPppq3/zqCKcRIyN4Goh/pNXqmt02qAyAQrbR0sCg7iOpZcSZHRqhYdrI9h4o9c
 Fl6lQJEB+M6gWk01VvY2rq1xL3TQISAf1IHtvNFpeb+EoE+9yOHdH45VUxjn2/sDtpHFxIRLN
 DFhIuL+ZpnW/Ywu4llrb2H/l+s8z9gwX1XOG+iEmsnnoTQT4KjpPxfyF9+mBNhAVgV7+mZamD
 Aq9L0SgR7Z//D61OaCGMKzhti6s3YEJyz9TT1PqAJP31CwVzdoVY8kYL4JotMqd+i4AwNOj3u
 Eg6rdZ2+Uk/4/zdzmUJcLEai09I=

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

