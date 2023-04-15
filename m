Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1D138A
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 10:47:08 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id qb20so51462375ejc.6
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681555627; x=1684147627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dISlVJnWoSaQPOrIVy9KR50yRndMlP9B9wtDi4lm21g=;
        b=SCjs3vMvK2vVbIo4PEH9d6VWabMBvQohKJbY+fgeqC2sQFvisjZ0GgspZWffRy8dZk
         y6KeaK7MPnpTR4p3cA/zb5IZvkRki0fwPrItKuI39DExUfQP+Eo6qx7mgNs/2FEkigiQ
         j565yQ+cmOkG8X7Zts82eUD6V5SoTeVooL9sBYn1KlKioXjtggB3zFRdkewj9WJlvryy
         0GUlkG4BcmAyatKWEVvcsIcLHMIomzkba4xtVOiqTgWqI4AzbA9mWG1hk0mSGJrbvd1B
         ghkuN13whkF8Wf6Z0FDvWBOofX5TIOv6hWP2k1UpuJbPYjl5OsdvaoMlFNnxs+Vhc7eL
         70qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555627; x=1684147627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dISlVJnWoSaQPOrIVy9KR50yRndMlP9B9wtDi4lm21g=;
        b=Solmn9UyIKTnZEIZExyHYHMipxGZIpznqbP9cGauBLNAfyk+6KrJQNJKLF3uLBJBBd
         q73UkDvKIwSOzX4uUWdRYsClKYtdvblYXWktxIFArDsvPkGXWhHx5x3hhuDBCBbMhh8i
         iXq0XzVg+Vu2PzpPifv5+ClTcUTiqTCeNL1PFgIsC6ElK2iaRew5dqbLziU85XXq559g
         h/K3BTDqfksJv4yFgtc4yEZmQr+nmAaZRtOZr448zGoNKUQfNtlfSyBvkukvMsapPwxi
         FeBJbRhj3+64+nmChAh/P6Nx7HzZUZRXKpMfFIW8Hc0nTMrz5A6YKTT/NyMA5ScqGAjV
         sMxA==
X-Gm-Message-State: AAQBX9ecpHaDrsrfPwaor08nF77uNO9RMLQIisZc6ufmOe+Dn8r2t6A4
	Ryjwwc4f0135OoOotOnOBgc=
X-Google-Smtp-Source: AKy350Y5afmiBhKRprtC5SNEdZYPWt8T99YvHJGrJGHbqb6r+TSAdL+giiW/xUXtzn4KHSMx6NBvAg==
X-Received: by 2002:a17:907:2149:b0:94a:4d06:3de3 with SMTP id rk9-20020a170907214900b0094a4d063de3mr1493742ejb.72.1681555627031;
        Sat, 15 Apr 2023 03:47:07 -0700 (PDT)
Received: from localhost.localdomain (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id m15-20020a170906720f00b00947ab65d932sm3607034ejk.83.2023.04.15.03.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:47:06 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-media@vger.kernel.org,
	hverkuil-cisco@xs4all.nl,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/3] ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC
Date: Sat, 15 Apr 2023 12:46:13 +0200
Message-Id: <20230415104613.61224-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415104613.61224-1-jernej.skrabec@gmail.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Beelink X2 uses software implementation of CEC even though DW-HDMI has
working hardware implementation.

Disable unused DW-HDMI CEC.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
index a6d38ecee141..38f40d69e5c5 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -150,6 +150,7 @@ &emac {
 };
 
 &hdmi {
+	snps,disable-cec;
 	status = "okay";
 };
 
-- 
2.40.0

