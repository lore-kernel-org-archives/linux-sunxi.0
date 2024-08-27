Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C971D3640
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724792488; cv=none; b=ZH3wJFUQFU7VEZ1NRWSCHPivmZW8ItNqLb4ZhuwjY06pC1iFzNGF5KfQfZVETIvJGeGDaKH3kSfo14f9r1qRNHPlFrHlcXb8NleoZMycPUtdt+XLfi1VXr0ildybQTuCMb1nFKnyknrYdtGyY6/xqHaeo02RmUwUL/h19sERy3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724792488; c=relaxed/simple;
	bh=XSFnSGs2Y7XJ0KFRhE+9wlN4kbPvLA8NqKdHuyx/dH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dy1BCoc7vNZEnbdMZBXk6DDv2743hK0NbjwJiXqwlVDNvXcZd3azWhwT7im0p3FuJgxhz/5BvZIir47gVIGe7Z59onwVGKrFZBud9Rh0CijXR+aCVb2neES7+/eJAQ0/X/rns0etm0wFSTR6QQu3cERCxAz8MPpC8qjtAmnNjrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azkrIz/y; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azkrIz/y"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff2f2so7503604a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724792485; x=1725397285; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Dk44Jda/PXj+bS5e+iE0HY0KNrSiPasrCnB6X1+Vo=;
        b=azkrIz/ypOXz5lXqfFBJZnEjFEnmlE56pwMhedZ7GjV0JkrAMYcp+rxdZBOnZJ/n56
         PvJ0c3JTKgLq5cGgj/wJ/hBx9cBylWBIFccChTbdtGQtbTksUt68bmXjY4fM2h6w0GLi
         cSjfj6rUCOkXzFIrqb+33dkWwsMoBkW4bzEMYpFMSEqSGa1hmbIztzhIuyf4MaN5DRUy
         mGAMrdbzSx2sBDB0jZq4gJoR+SRi6BoUltM/cEmpRwb3VN1ac5sUt/c9UeukOvl5fweM
         E7AH5LIHL/FIR7fJzHwbyZD6v4MXQrIKvmnPs7TG9ZeqwCAA5p1ZncHJjBG+qPjCOZx3
         r7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724792485; x=1725397285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4Dk44Jda/PXj+bS5e+iE0HY0KNrSiPasrCnB6X1+Vo=;
        b=a47xdUuvaVKb8L7TAYvf3nCofavOXlcL/nWHb3VouAFQUPDLntbvCFJCYbkGiKBi8h
         ZmgHtP+totocmjfBA6rsJ4KyZ8vPK1rsoTtAQxoByx0a3y2J2DnEqCXj7twQK/ONrvcj
         5dEH0w3CWuHKjjOmsYVCIPk+v6ExymrAs+UREdIJ6rZBl+L2b14hUF1pc50H3Um8Npdf
         vNGM09EwpIBRQcJdMdw/MErTM1pACr4C/Ur846n1Bm4qcZIyGVDHqhYlld0K5CAoEiwt
         aKTgYEYTlg4GcaLEUu9lid5BKbI0pLFc17TShhtEy3k9y0UA7ZrZdqwAWiCTqg7JbLA4
         u4mg==
X-Forwarded-Encrypted: i=1; AJvYcCXU+K5Bg6SpT8TIfH1CgxZJIqXVTsORgOI/Llt0RSzFwPLcI+uC2qpUXbcCRiBE+oDU/4bULJ20daBZng==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGSQG+0uM5mtvBnLPKlHjtJ5qcGQRd0RVR4PQPJBnhB/2ySmJD
	8KGPlyyrUeGfOeuUUnbSyISKHZn0IcbgKCM/0uMbQ32LdeJVYxTv
X-Google-Smtp-Source: AGHT+IHLSXoIkb1hPxPUG6/bm1IiGleYMQDtLPTORcIZT1/WnSzc+7I51SMbykPJQnhp8GCN7LpC5Q==
X-Received: by 2002:a05:6402:5410:b0:5c2:112f:aa77 with SMTP id 4fb4d7f45d1cf-5c2112fab08mr342140a12.31.1724792484799;
        Tue, 27 Aug 2024 14:01:24 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-82.rib.o2.cz. [85.193.33.82])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1c3114sm1405835a12.13.2024.08.27.14.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 14:01:24 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Tue, 27 Aug 2024 23:00:45 +0200
Subject: [PATCH v2 3/3] Add vqmmc-supply on NanoPi NEO Plus2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240827-nanopi-neo-plus2-regfix-v2-3-497684ec82c7@gmail.com>
References: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
In-Reply-To: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724792480; l=754;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=XSFnSGs2Y7XJ0KFRhE+9wlN4kbPvLA8NqKdHuyx/dH0=;
 b=V6aFjo7k78vnB1rvzFLyu/fc+8DwPgrvZSZdSawRHt+uKz0/X7RBF7glboSyFAyIoaAa/aaBJ
 017gdp/pMAgDXJIG/DKwjut/nkt99jNprqtx6n2s1lLwuSgPHJQGOlD
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

Adds missing vqmmc-supply for mmc2.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index 526443bb736c..609560a9d6dc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -157,6 +157,7 @@ &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_8bit_pins>;
 	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
 	bus-width = <8>;
 	non-removable;
 	cap-mmc-hw-reset;

-- 
2.39.2

