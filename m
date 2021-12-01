Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3F2C9D
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Dec 2021 18:21:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so1836819wmb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Dec 2021 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0znfekrUInn5HV1vA+VAV/rcSYZjyQOcwwYpPx9vb0c=;
        b=qQm5NiCFVGKxg2ccCKmwp5W8k1nsd/J2wfjXDa8iUyIz0D67VPHMn0pI11aUE/QPmK
         Dc44HdjJw7MQFOxEAD6mqoB8XVSN3cR9TJjneDBDecLsVYuV4IWSV4v9pmfOKsUHGk/0
         d9UK+D17jD10gEKT1ifKjKeQgBAhquZMnwctWq+sEyxn2+LkOp7VV41AFmVRsrFM8dfN
         6ASlyuAX6BoxZMSMjwiv0jW34bvFbnCqofmmgcVpvcLFQXGvwat5LnQ6eH8wlWOYnvLq
         33ReiiWIiXS1NAASeIH8wP47Ri610zHLGoJ05pKDkOvOZaIdNpQDc+sd1rqfDxNDhav6
         dnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0znfekrUInn5HV1vA+VAV/rcSYZjyQOcwwYpPx9vb0c=;
        b=iNbVlZ4EvzOCmhSkg1waHuswHBfc9rfWPsh1crXinY75T90DDrNaN0vBn8cmHMUkRN
         LkQI1z2NULnIalFbKLPjuZ/ggmv9fUtfYyfHAl/uqKWrSMAWy44l0JWirrtSnujHu8OT
         ghTdLfZ2asu+HgbTYdIRuFEL9YUKeafd3tI79LlfdfAUjWqV0/oHKlkqIB8ttwrYdbTV
         /8EvgAuJeDnUCPoVWkiXtvmf0OyxfwtqeCTrxl/0c2cOOlf0ZlMQe43j4k1hjG6DYNaQ
         +oCfDI1KUcBSlBb16V34sItSx5YGi2ohTAK7T+T36cwgm25PHNFTpNZ3LST7cVqBGxaO
         UQiw==
X-Gm-Message-State: AOAM531B8XBSy5LjUR+rpoMNthoGg30VFvuhBBacs4egy3PQvhTX56Ys
	Pj5WvKJ6XqPyvOn/4IKgSO0=
X-Google-Smtp-Source: ABdhPJzrKzPCMz5gik93CwtDXbaqyj6tOPCbkZhxB4yRL/zcWPPLgGW8dLsEpVoOv7BFWWTNZI5qIA==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr9069048wme.182.1638382913573;
        Wed, 01 Dec 2021 10:21:53 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id f7sm604705wri.74.2021.12.01.10.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:21:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 5/5] arm64: dts: allwinner: h6: tanix-tx6: Enable bluetooth
Date: Wed,  1 Dec 2021 19:21:18 +0100
Message-Id: <20211201182118.1213806-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
References: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tanix TX6 comes either with RTL8822BS or RTL8822CS wifi+bt combo module.
Wifi part is already enabled in tanix DTSI. Let's enable also bluetooth.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-tanix-tx6.dts     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index a6e69f4b2666..9a38ff9b3fc7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
@@ -13,3 +13,17 @@ / {
 &r_ir {
 	linux,rc-map-name = "rc-tanix-tx5max";
 };
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8822cs-bt";
+		device-wake-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+		host-wake-gpios = <&r_pio 1 1 GPIO_ACTIVE_HIGH>; /* PM1 */
+		enable-gpios = <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* PM4 */
+	};
+};
-- 
2.34.1

