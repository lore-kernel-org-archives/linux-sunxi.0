Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E1153BDE
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653586; cv=none; b=EnXC/xBhzHFnMWwJvjaqCwgDnfghVBW7Z8j3jgi5fvI8Rgt2tmLvWajUWxq+5pXpgenmiQSPy2SYL6A8cjmNmA42Ac+H6uMbLprHZ57fGftMuFudl4H6PoTmI1jmfnaHooabh7jrzvsILIsnCSqBmZ+NNbJyPq8ILak7Yuihrn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653586; c=relaxed/simple;
	bh=oEZGVSpKAL9LQyHy179I5iFvzv2SL9qCVoa5cIYUU6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZPcG6j8fPLbvX4x/qB6NYB9eM4gKlmzXYbGwDKimbd6a98QIm7/nvXjVuYT/DDYzvzZ6CZG7vdDr2TkcHqfIYeYps564+7g6fMUdneyMmJK0Vb7ph75toeXn3j6abt6CwTOalGtdCaE2VKx/jyYGSNyfd7FK8FRUKZATVUaekAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQuqT0x9; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQuqT0x9"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70388567d24so135874a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720653584; x=1721258384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tCloSSGf2ls5vVphG1Qx4UWE9Y/t0QcbBLIGFUGZYQ=;
        b=kQuqT0x9uYAYHdkauL6hfZuyoV8npTu38boFeuyhN3Focg5Ymxyyho+XjkqfaOYItB
         XqJQEwr/8L317uiGZRYsut4VPjPMFmUBU6Z9Bd6qeaZq8G7Q7yaPizsQop+F/szm+TXB
         47oIRVEpOUOqqTNXebyaxzrTRNPpOnKY2sJ5V6vOppfQVWO/BN4wl3Kpn9eTVc/V6iY7
         GXXbeHQQRP7V6SpSPpc2hk+M1UvLR+qCNj+Fozs+WSy8vrhwpvvMN2Mtw4mgUyl+ZdrW
         oA0XB4fljmbdsktqru8MZped4uvVgf8cnvWeWNIIQvayJlZN/G2o1cPVkXRWMlURX3Kb
         60Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720653584; x=1721258384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tCloSSGf2ls5vVphG1Qx4UWE9Y/t0QcbBLIGFUGZYQ=;
        b=RNr+GJ+5R5IGty1J8OwJBse+DvekNkQbS4N4a0CmmlkW+N2+E5EZdTPRcZJFP4IjsA
         hz5ZyZ9tY5CRgC0Bg+IjJMUWb7ZkjDAc0bNoUAHrd4rYixfHWlfczF0asYGglgZq9u9j
         yM732cqK7T74KjS0WwDXCq1F+zEQoMDg9hjtr01gLSXhh0iYiFOis4oloxQnwqHSk6DO
         cp3vTrd+e2KFCae1vay2e/rSEYGZvDW7TuRFB8mb6cnFPpra3x1zaD/YXOvODmaB2gzM
         w1SBZPVn3U1ODtgQtEqd+qPFdH6BeEjou9UgyGa8tQZF+C0ZdihdyAQdRZG8SSRHeQ3W
         1mdQ==
X-Gm-Message-State: AOJu0YxU/t5Y9j4ysSa1lcIMtKjhBYxJAGhvBdS++zxPw17JtfTmq7+e
	i2/lUJO/H6vqlLLJYm+tKNcClt66ndoJ3KDiLksr7OAaEihvBnfrx/KZcQ==
X-Google-Smtp-Source: AGHT+IFYxw6VoIwFGGtKRJcW5v01T7CcTW+LMSmlydp5CzuJSogizqt/Ee+DvP9E6cclPQQdVyX1JA==
X-Received: by 2002:a05:6830:3498:b0:703:6d21:5dfa with SMTP id 46e09a7af769-70375b411bdmr8117969a34.32.1720653584148;
        Wed, 10 Jul 2024 16:19:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374fcbf30sm1040207a34.65.2024.07.10.16.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:19:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 3/4] arm64: dts: allwinner: h616: Change RG35XX Series from r_rsb to r_i2c
Date: Wed, 10 Jul 2024 18:17:17 -0500
Message-Id: <20240710231718.106894-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710231718.106894-1-macroalpha82@gmail.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Change the Anbernic RG35XX series to use the r_i2c bus for the PMIC
instead of the r_rsb bus. This is to keep the device tree consistent
as there are at least 3 devices (the RG35XX-SP, RG28XX, and RG40XX-H)
that have an external RTC on the r_i2c bus.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index ee30584b6ad7..e2bbd22bd80a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -201,12 +201,12 @@ &pio {
 	vcc-pi-supply = <&reg_cldo3>;
 };
 
-&r_rsb {
+&r_i2c {
 	status = "okay";
 
-	axp717: pmic@3a3 {
+	axp717: pmic@34 {
 		compatible = "x-powers,axp717";
-		reg = <0x3a3>;
+		reg = <0x34>;
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		interrupt-parent = <&nmi_intc>;
-- 
2.34.1

