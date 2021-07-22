Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B42FB0
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 16:12:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id n1so6495050wri.10
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zst8QWS9wJcufrSJq8cn6Yi8f38cET0pmK8IThgydIc=;
        b=M2hUKSI68kKEBDfWO47+Amg8uxCWD5J4+fkI2bNhMN5wbGrFC4VGUpdDVKdn2aSJ0D
         8CoxyKcI92o+WtYXemT3lhBklzf5SyhNV/K81nmZGXYCShHR2cxXeltc/6plV9tPys5Q
         v2rJ3ffTlUL98O+2ehYUSkxwYWI25kz23v52gqlsQD2bwNt84kcacy8psazBU0CrIzDO
         +YB5ScJq6MfDwObEvVLKtqGEGvfRRz5aO5xNU/pWl4Nfi2vAswcOW0BTqmsQ9rriqvm+
         j+4/MC8BfFAsVMJJmN4ZZmkfkUfm/xrzTW54joFPWK37o9A3THjg7OcMgungdTIzHigJ
         dadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zst8QWS9wJcufrSJq8cn6Yi8f38cET0pmK8IThgydIc=;
        b=ImXSLJpivWavc1oj2GmJOEYL++xsNirJ2FbCPeoBFrJWP1NxFDckCiZWSjHcHFj2z4
         F6N3PN67RbW4nntiaO80y2H0eNntrZ6ovRrHScp3Q9HcMg1NG9Kr5i8BFuSj7L9v34Du
         A8i2BR0uNpwXLmGPugWcFazNEdK4k3IhjlZityV0M5VeUwTv1tuYK0gBXuEfJcbZbV1a
         bgUY8uj3DxpKsooKWCYGjWXOVipr+WA3LjX96SCcj7ArVdCiM9tWLMxcJ+2hzRGrN281
         GwzVM8c/6Jc0kQvvNXOQRK4TxiFdLt7hzHzOTTNkb7m3+t9IdxVFs+/yBEtfCcg9d9OY
         T7oQ==
X-Gm-Message-State: AOAM530Li5y5eB6t88lRVRQTnWsxEe0aaEpJD1SS6mdMqN8/0VHGbPxK
	j12i1ijkLU3Hn26mXEFYbQ0=
X-Google-Smtp-Source: ABdhPJy/k15RJ7Q3aQbvZX4M3mqsTXXPmO7taXgfUcuksfH4NZcIRUMr214cVnZVemve7sija4A1EA==
X-Received: by 2002:adf:c448:: with SMTP id a8mr724940wrg.103.1626970347778;
        Thu, 22 Jul 2021 09:12:27 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id z6sm3585363wmp.1.2021.07.22.09.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 09:12:27 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: allwinner: h6: tanix-tx6: Fix regulator node names
Date: Thu, 22 Jul 2021 18:12:18 +0200
Message-Id: <20210722161220.51181-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722161220.51181-1-jernej.skrabec@gmail.com>
References: <20210722161220.51181-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regulator node names don't reflect class of the device. Fix that by
prefixing names with "regulator-".

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index be81330db14f..02641191682e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
@@ -32,14 +32,14 @@ hdmi_con_in: endpoint {
 		};
 	};
 
-	reg_vcc3v3: vcc3v3 {
+	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	reg_vdd_cpu_gpu: vdd-cpu-gpu {
+	reg_vdd_cpu_gpu: regulator-vdd-cpu-gpu {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-cpu-gpu";
 		regulator-min-microvolt = <1135000>;
-- 
2.32.0

