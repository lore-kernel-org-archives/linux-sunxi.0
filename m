Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D3341D107
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557619; cv=none; b=bzkaIKOsqr2Gbb2Jig9oUx2tqX60ky7Vk93NjepVq4FMjbUch8Y0Igb7C9vAeGicTBjtk+ErW25k3lnXQQlpgrN7s1R8ZzuqyowoKbj21/xCehrha4O4yZBpRTJ/2hTnb2dwNktc7jp8lTTmkWRFcnvjqiA/vFjO7cLck2zz4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557619; c=relaxed/simple;
	bh=kyhdItw85ylagfnRcB3Fj6tva+77/cxN1usxvESp3pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cumLztBLhoN1LseHrhHSlDAjUty3pjsXVbbdqFLoTVNwLti1Fqdzs+v5dV+/zM4nMTPbWW0ZVeKmZzODulDf/U9ibtpQLK7Vgwvnb3UPjK0COblpCSzgmlwNrGkNvseWhjHZwmO51+KAFy393myoonykvqzUaP6te93JQdbQZ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anl/41EF; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anl/41EF"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5301a453186so14872651cf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 14:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557617; x=1789162417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vu/pZRzi+PHRIHNfr1m3RJJ4wr9M9/chVTLqWsd29z8=;
        b=anl/41EFxAL2qvABJE9vBYp9hMOEExEi20iftS9ZYNNSppqJqki/XJodtGisk+K2cp
         GzZOfKj0Wgvb1+wyHktIo9W7d6EbeXuzNi1XJ/27LMkLJejC/Gekw3GgiujLCNOfSpe3
         +vrxbfPf4LdDsaegbizikFbDdGPaU+/i8Jvex2GTuuEtq4HeXDwjub1QE3e8j/TOl7u1
         7ihmtthTd0sPX0j6T0yzKUxACBNeAdpUZOBK0Q52jgI59cgIjXQSAHrxpkNoNv7/im0r
         eP6w//1n5EQQ1sz4fdVQ5MGl5d/dkOfEbnEJT2kvwtk6b6Xsse5EiQ2lxJHG0Hk5bybW
         czvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557617; x=1789162417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vu/pZRzi+PHRIHNfr1m3RJJ4wr9M9/chVTLqWsd29z8=;
        b=U6RM9YKJM+WwBvqQ7NrGOx24vFUp3Mh0FpicJvTacy1jBzDHyYGGGYbcs/pGGounyS
         OBRq0qeG10YxyYy8FuO+bN+x464+I6ZrN5TeziwLKICvl66XreDL0UlRHtTmCGYF23Qg
         Jzz/Kcw7Fsrx1KC8HilmD5L05pWMiDySg7xMn4MWvK5guX85lBnK20lVWTRNZ7m5LP+T
         DXG7YMy0Ex7AD+FjwjhtexUyp+tTPcxlHG8AzwO46pAaMUQdHLHpuoiV6I8I/ZAKQYPl
         Ocil6G02ISH03OhjoW3zXCIR4DxnVK2yUyiI378DCppHYG0oNsoX3iAMlcuRzSHcSFqD
         PC4g==
X-Forwarded-Encrypted: i=1; AKwUvBw858B/mL/Xdl7U0Gw27PcGtLL/AUU5fvUc+m7szC4nb3OrcTDqmeOM/2pPqcGizFkcaK0mCFkx9+rQkw==@lists.linux.dev
X-Gm-Message-State: AFuF++npqExGzrbudlwyVIGLF3vmYVc8Hz0xm6BdvakLa4ph524i4eBx
	sLOK3S2u+Tms8kGk+qxBrKp/xGqwaTKsPC3XJyufm8TsPJid7XyrE76yGsRWgFk=
X-Gm-Gg: AYBFou3fj3N5ax6+6E6Xe5j5lwgZ9xzwN7JDusoqHhC9+zFEtSPgJamqNIcrilgtaRG
	KYkEJUK+GpXfd+kPlWVp2k/KKrry2Hkkiu4K5nYbfintka/jxO+2LdYIhTEPceuoD4CCYOA8WR8
	fdB2Y3ZdtxrRk+MwR43ocNZJNYJXEFPw3rqWR8e7tlUXRwyRMYVrHwLha+Q5ykDZJgnlLUtOtA6
	sIZu2FO624fGyLVeMAlbiSkEG7U8z2vyiX+CLLhNN/YP9zYEIAeN7FW7K0mOxU4kWwbfWEYQHU3
	q11Bj1bdzv4NgrPYNfXTP53j/mbo5kMNyGregFYnOI15jkWsrJDaa9JiVYNVZoh/yHUJ9jaVgMb
	A0E8uOAdZDZrVf/ySPn5jll6Axxr0SM6gYAGLYzWgxRMbBZxuXDTR3YQwS8dmjjvG7a3ZZtih5Y
	amjlFscdMZOC14Izao+xq2TiLD8PV5ToEsyRTMdyEv6gfx09qIlx7VrLbM1SUEi+9GUvTa/M5yP
	cwZOhd5eFSK8OA=
X-Received: by 2002:a05:622a:4a89:b0:52d:8743:bc83 with SMTP id d75a77b69052e-530549f8265mr111105391cf.34.1788557616511;
        Fri, 04 Sep 2026 14:33:36 -0700 (PDT)
Received: from X570.phub.net.cable.rogers.com ([2607:fea8:744f:d200:9441:f2ae:56aa:8a81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054227a0esm29646561cf.29.2026.09.04.14.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:36 -0700 (PDT)
From: Barzin Lotfabadi <barzin221@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ryan Walklin <ryan@testtoast.com>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: orangepi-zero3: enable HDMI output
Date: Fri,  4 Sep 2026 17:33:29 -0400
Message-ID: <20260904213329.3910099-3-barzin221@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi Zero 3 exposes the H618 HDMI transmitter on a micro-HDMI
connector.  Add the connector node, wire it to the HDMI transmitter's
output port, and enable the display pipeline.

Tested on an Orange Pi Zero 3 (H618, 4GB): the sink's EDID is read
correctly and the board drives a 1920x1080@60Hz desktop.


Signed-off-by: Barzin Lotfabadi <barzin221@gmail.com>
---
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d912..444773e4a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -11,6 +11,17 @@
 / {
 	model = "OrangePi Zero3";
 	compatible = "xunlong,orangepi-zero3", "allwinner,sun50i-h618";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &cpu0 {
@@ -103,3 +114,17 @@ &pio {
 	vcc-ph-supply = <&reg_dldo1>;
 	vcc-pi-supply = <&reg_dldo1>;
 };
+
+&de {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};

-- 
2.51.0

