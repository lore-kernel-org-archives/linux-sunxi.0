Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6425A137932
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716230575; cv=none; b=VX/M0jnfYD5MEUuJNuVad9Ly5DewVx+Lny3zkYHGi2MsuOto4+nHkK4jVTzixif2VV8tSJ0LlYbZ27CShWLEm8mQRr0MmkxD9N8lTLyFlmD8g36SXjOSQPyix3kz9eXbwm9BP95WsY6hdnloqYHzW5JggJKNEuMZ10/nMzJ26VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716230575; c=relaxed/simple;
	bh=RAL8/W82ql7maGP9+Gccu8VKK+bvQNcePTIKExMfiSU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ULXv5gOojOo5HR00adDOZ2FM9mrygqQ9htRHIggX9scBX7KyfuAtXP/Mr3eTDvDnKXgAldAY/hqgx+1iYi+EAu+46mFmUUvNOipJkWNa7eMM4CUNxDpjiDSJW1j55bzh+dyb2iBwxDMD3OTp0lpQ+kl5mOGUYjYl4MIGR+xM8Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL4t0qoX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL4t0qoX"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51f174e316eso3698954e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230571; x=1716835371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2oO4m1fNwQVp4jNZt/1i65mTC9NxrLa2XCOe6bVJYw=;
        b=lL4t0qoXSGydqMi9DQI9N87y0Uvo1cPdMFsLwMjr2iCxXVbgyOf39sqG7jwFBcPx6t
         5nCO+BVmyFH9xItUfaBCJf0fQF9eoesMmhZfxeuiviw2HrvB+D0rbx2jqHAFd/tGCSs8
         qq5MRNtL6amaz4DGtLlCRIgEc/aX7qoabN4znNov4H58s1jeIxaS5D5fs7QrLsgr40jE
         KJhtdp4+H6ScvlDNkEhtxhQaXBUqCbihNNsugqNOeguPBXpNQjNJrSzyM48cVhqtIg2Y
         BJC1nlsD+ik2mJsurY024X7BR5crIVT0QzGWkITBAYw3LYtJOForV/KG0wKSnGT34Pz2
         zhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230571; x=1716835371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2oO4m1fNwQVp4jNZt/1i65mTC9NxrLa2XCOe6bVJYw=;
        b=i6s8n4PsYw3NizTIjtZyvlEzlU9mulTvfr4AugTAdzvmXRgAyg/uPcY+iSRCttUgj3
         DITD+4ui62NghDYfiBOSecljJSLvGwXTpJmjbiwlwtRi7AMHkrM6vuTx8qziSPUB3nr0
         Yx8pB2HCSGmnHdS4yLhpEY/UbD/GW+/yuz57BbOKc43iaroQ+f2s6bnWU04l9pmh3V1Z
         dm14xhEDoELKmvPBusS5oClhOXNYw5/b/sFUyhN7+CVZDFUSMVa14FvCeH5GInqSCFwy
         RoZE0XkURomb6ZSf/xR2ZQrXCwOBBD8Tfuk+GPzz23G7wvNjqIpQm3dYXEz+MzGHSdoH
         BaCg==
X-Forwarded-Encrypted: i=1; AJvYcCU+AZXrpkwdK1rf+22yxfHt38Wb6ZMtu7spsn8cJTIwmJLQQjvsMmUGDGa5hYfq6tZw1ISaScYz7MCNyiQ5ReEZB8zgMhLa2USS/Fc=
X-Gm-Message-State: AOJu0YyBXmrUH2gDA3GbDkJOuEzaP7OiSuA2NbNJLYxGWRaZoAC35DaE
	nMqy13TKXZ1nu99Jz3vBlEuwG8HGtLLT6wCtYezJXNZB5hu6U9s=
X-Google-Smtp-Source: AGHT+IHowG1lUazF8YIjo3wKGFKSPdaQrkEopgqvVcpbn/3onng5ZcWOPaKYiEgzwOJh0DTC8Q41xw==
X-Received: by 2002:a05:6512:3494:b0:516:be80:178f with SMTP id 2adb3069b0e04-5220fe7934bmr19194028e87.43.1716230571213;
        Mon, 20 May 2024 11:42:51 -0700 (PDT)
Received: from localhost.localdomain ([188.162.49.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d335csm4368967e87.125.2024.05.20.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 11:42:50 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Mon, 20 May 2024 21:42:18 +0300
Message-Id: <20240520184227.120956-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 387 ++++++++++++++++++
 5 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1

