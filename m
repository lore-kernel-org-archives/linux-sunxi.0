Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F932C9C
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Feb 2022 00:28:09 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id s185so6700715oie.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Feb 2022 16:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HtB4xB7o6hXbgLfwRbUeCoDsxhbCbtJSWGozDMovVk=;
        b=uY5z5aTBkHrcsDost1oD/4x7S5RARYwKSU3vc1RBvAKxGXRzSsJ5DNDgOk8OuFhEw2
         odjQ0ir4F8W4NW2C9RTNObcDP74ehlpKjYmkc86bQOBnYwmsY+Z94QLKvyY8ZWPVxDDX
         UgdwXuY7Vox1W6i1Phz3JRDt/fW3zNtx6cr7yCGVtLC84bLIgOdEuK677IvHXvxsgF9P
         SFtbd2xUdBks994jjXQN7DVH+OQuinmhXGL4Uu0wtyoyRrOuHlDqgI3kFmvJkI+V+NBN
         yiyNT6zNt0hWKo8khYLps0TedO8LuROrEaotiY5E9Rn/RPi4x8y8plCNvKRxhhTWLSoq
         BDlw==
X-Gm-Message-State: AOAM532Xm+neyzBeYIcYgBgeMGX+I9i2GOYNhpDWZaWojL5HnWTlc3LH
	dSu6hLc1pAm/xmojGRpWFA==
X-Google-Smtp-Source: ABdhPJw2Dg0v+X6ZepvOu6aani78Em/DxuFa5e5HsctFjHeKIC9FX4la9ddS6qjjU38YaYQT3enVVw==
X-Received: by 2002:a05:6808:20a2:: with SMTP id s34mr113274oiw.295.1643934489148;
        Thu, 03 Feb 2022 16:28:09 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id v10sm178184oto.53.2022.02.03.16.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 16:28:08 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: sun8i-h3: Drop args in 'thermal-sensors'
Date: Thu,  3 Feb 2022 18:28:01 -0600
Message-Id: <20220204002802.1214602-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "allwinner,sun8i-h3-ths" thermal sensor has 0 argument cells, but
the consumer has an argument cell. It is ignored by the code, but the
error was found with some upcoming schema validation changes. The schema
and code both agree that 0 cells is correct.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 845f25235407..eac2349a2380 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -245,7 +245,7 @@ thermal-zones {
 		cpu_thermal: cpu-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
-			thermal-sensors = <&ths 0>;
+			thermal-sensors = <&ths>;
 
 			trips {
 				cpu_hot_trip: cpu-hot {
-- 
2.32.0

