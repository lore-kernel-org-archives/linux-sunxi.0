Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C98381AE7
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Sep 2026 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615338; cv=none; b=cALluiDTy0TI+l66PdhyrntWSvWdOWBTADA785JjznrANLQUVBaQ54Wue7NQGn7DYw1Js8q6KSGSovCKheY2msrUHV4D/u7EJBWXl77xKk686CfgC0qIafzek9cscyOCy3FH/vQEEykMNCfh2OeE2mRLllYUMJcwngp6a+Js/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615338; c=relaxed/simple;
	bh=E4NOIZw0MoIJK44BtS9/uuvw4Y/ed4AG5hDSunS1C2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJAhj1tZhYM0ve4+4GCJUkzXJTND7B9e50k2I7Zs1oZ1C4YLIaziIsFniaXV28C9609YGFTgkMoGICDqeoDtF1ZClo3zt6EN5bl/+zxt2J9LCR9GEYh/DFWOQABcozFrefZ9ewIg3J5exP7vcClROb85Vu64b7J761hq1YRkWwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mH/aEyBS; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mH/aEyBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ue
	C5lIuArC4NcqzIcMwBR70F4cNYRtDiIKMXLIakGak=; b=mH/aEyBS9/bpfl6S0P
	eDwFxpjmwSSuv2g/jxoO5JsoaowSIVMai8x79y8DGpX3MlW48s9ZQeWTX/rBIUUs
	1n42y7Ll8M+c/CuRrYNTK4UUiK0r9NSmY8DYDB4XQXBs09lfVD4HPyX2zzIiUuzf
	ctdT7rmCU+pdoNXjZTohPkY3o=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_41+GpxqLJ+DAw--.3882S2;
	Sat, 05 Sep 2026 21:34:55 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] clk: sunxi-ng: a523: Publish the main CCU module alias
Date: Sat,  5 Sep 2026 21:34:52 +0800
Message-ID: <20260905133452.64544-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wD3_41+GpxqLJ+DAw--.3882S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWUCFWDKw1xJFWfXFyUtrb_yoWDGrg_CF
	n2qrZ7WFy8CFWDAF1jya1rurZYv34rZrnYqF12934Yq3W8uFyfAF1v9wn5X345Xay7AFy7
	J3Z0gFW8uw1UKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxQBoMWqcGoAiPwAA3t

The A523 main CCU driver supports module builds and registers an OF=0D
match table. The table is not exported, leaving the module without an=0D
alias for its OF device.=0D
=0D
Publish the main CCU table without changing clock initialization.=0D
=0D
Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PLLs=
")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/=
ccu-sun55i-a523.c=0D
index 20dad06..d0c4c70 100644=0D
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c=0D
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c=0D
@@ -1685,6 +1685,7 @@ static const struct of_device_id sun55i_a523_ccu_ids[=
] =3D {=0D
 	{ .compatible =3D "allwinner,sun55i-a523-ccu" },=0D
 	{ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, sun55i_a523_ccu_ids);=0D
 =0D
 static struct platform_driver sun55i_a523_ccu_driver =3D {=0D
 	.probe	=3D sun55i_a523_ccu_probe,=0D

