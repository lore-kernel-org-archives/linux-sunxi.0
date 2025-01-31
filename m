Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10981F3FDA
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 23:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365447; cv=none; b=jYXUhMhVGSSGK6jxW9poz/5dt0h30SBLy7G8FJFZsm5W2MK8zQnm5fv3ALw4zmBz2pYDm9uZRIMzbUJ+MRgV5zau/4Jtbt/snO09iVyi8NYNmwiNPcK817GFbiZMGpr3D4c1ub3+IqlvxTzTUI99y3mjWIuxvgFdZqwhDtl/nJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365447; c=relaxed/simple;
	bh=7weosOB2tkJzFFCK1j2kvlQUUXPViwlIjKFLoG1vu/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H12wUM51c7nsSwVpt6XwIdfwAqIdkholF5vXckOoJQRLA1+bdtsL6GxXz2k6TxsgqYLch8th30In0qLkuocaVZUnjLDYNlxUE8nRJKElFcKqWE/vSscQz55T2Q+Xdab4JGFtoYeOf2vq5BDIkN491MO3i4cJUB5MuO4TZ+IQx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/0YzTpR; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/0YzTpR"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3eb880e5ac2so1448447b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 15:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738365444; x=1738970244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rSvVS0xRSmkwB2ilC6LIMN2F2AJg2DEhA8U1xiK1AM=;
        b=W/0YzTpRMwSPtWoM8wo9cyTNf2x6QuIO1ccMOT9vwMf8JX8CygUy7lpj7iKxDElyoo
         39laqMv/HrE9rEvIKTPjwp5hhbGTuD+HRbRDCbkuRMVmR9PC40n8ZX+Rc9ZYzPVOoNqL
         Su4mMpbfHZpjzEGGRbldFOYluY9OatSmQ48MDHDNhpH97i6Hb3cOpbJ1hGV+2sR9Vs4c
         KGsW3kgDZp/snR+Iar7X+mEQapQBT8xQY+wMhRngldmzOdutS2dauSSUkAL6FdsipObA
         St2qoeSdgNGvASbFckUwQPi9IfusrvT0agJf+j8OSC9+I6zQ5C7vMQ4jaM1/gxva4klr
         vJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738365444; x=1738970244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rSvVS0xRSmkwB2ilC6LIMN2F2AJg2DEhA8U1xiK1AM=;
        b=YCgtWcNtSjXi/Ln4C0Kerph6ydHa68pQzKGDrg1uOf1gecbNEvAC6zdA1LGiDxnU06
         9wmHR2nSkETHv9DlvrCJVSn7zFtEcYkZpKQwL1Fr/NRFRTKErHGT5kc6dwjfZPGs+h+f
         7ExajCAmGFT4I+QsIQb4B0Ccu4032opLkCQqKQfRqi5ZzfRGv7jL/TYxTQYfCWNLdoML
         hGETHSZiM0cur06nZTvyxa9WPShr6rh1hAcp/TKuqVHHP2qw1wOVVBOhbbFA4vQQ+g9b
         jH2HmzdtnIwwcKYdcyNKYmSJ/5E2wJIwMD2rR9b1Ey4C8P2jYKap+fht+GfnNugGfWU4
         2Yow==
X-Gm-Message-State: AOJu0Yw/2t5n1VVHNwcp1ZTwU6b6N6hFPhiXW5g6b80vZ1K7lua1nfYT
	WzMvmPIJnuij7U4L5osKW/EPgAGnUruESG0odBQhADtdxiR0CyKCQ5DrHw==
X-Gm-Gg: ASbGncuJ+gXzl1tBuhN9WnlkYvm+VB6c98zfjl3eipn3MpWv8Uthb/Del4ZX5dZ6V9S
	u7Zqnk4BqaZzDbdHUw0E+AWM713KZgiweyW4O2MLUtMzq23W8q5t2jaBySACAGE5WkvhLazW/2N
	cZj34H4ycp1aArTRZOQn7CwKIDDWFvRRmK/1CeM6rg1qlQtFaiIbX4tq1sFsmsZJyuRT97MZ7/R
	OgD5xXSq47f/ivUIfe43ckIcjnr0CTtHv5OSqTDzyCTpn7EvaFk8pG6vZca/QhU39tN4D6GhxMF
	gvyRZrviXCuaJPJmzutVsdNYeeQdbCpCEXA=
X-Google-Smtp-Source: AGHT+IH9EIO5UKi3zjTou7NgE9ZwpqTCVd5TQ3cdZ+Vw8R7Vh7mtJwLawupTinMPajo6ILkkJKilEw==
X-Received: by 2002:a05:6808:19a4:b0:3e6:580e:f12c with SMTP id 5614622812f47-3f323a3eb95mr9621264b6e.10.1738365444654;
        Fri, 31 Jan 2025 15:17:24 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d061:e6e5:c6da:b514])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365bf31sm1099128b6e.34.2025.01.31.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:17:24 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 5/5] arm64: dts: allwinner: rg35xx: Add no-thermistor property for battery
Date: Fri, 31 Jan 2025 17:14:55 -0600
Message-ID: <20250131231455.153447-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131231455.153447-1-macroalpha82@gmail.com>
References: <20250131231455.153447-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the property of x-powers,no-thermistor for the battery of the
Anbernic RG35XX series of H700 devices.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index a231abf1684a..0c89ccc662a2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -237,6 +237,7 @@ axp_adc: adc {
 		battery_power: battery-power {
 			compatible = "x-powers,axp717-battery-power-supply";
 			monitored-battery = <&battery>;
+			x-powers,no-thermistor;
 		};
 
 		regulators {
-- 
2.43.0

