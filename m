Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49CE8C10
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 18:27:32 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso24277058pjb.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680287252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4FGWSIPST9m6YTXbscC7ErUtHPtpC6n3urFFBCXSuI=;
        b=74oWXDIlBPU68uwXVejlOmomkabmhkdTDR+caL1MADEQSdjPjVuZ1dMDPKYm3jiBJz
         f89c39he3eNwXJGk9iAPuh7PGV5QlqHep+5CsA9D0jjjZt/ijv8kbwl4tOExrz03/UFv
         TJucNRYuNMDcIDYmsQUJs/CFGXH3IbzJL6nsSD3YASqmB3b8uJDdwCFHneyfAiEfKd//
         k2DilaXoubfPSHiuqOLWcY+cLX1kMibk9FbQY45f4ttJJBOyxxPLTMSX06VX6i1X1rO9
         ZP/zJsdxyDYzQG+uqof4J08lbr0lWdOdvCUFGCrR6LtqcbjSN60FwFniWzA2bSx8zsUx
         00jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680287252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4FGWSIPST9m6YTXbscC7ErUtHPtpC6n3urFFBCXSuI=;
        b=RlfCjRMZDZI3u2QlazoMC09JODh2Fsi8xnZJmGs13IubKa4Dm7Z+wE3X4kTDjcOhJF
         oxOxqe2Hk9XJlXHzc7T561U6NlgaIhRr0FOKHvFc1bS6OT0xyGPYSwREXmmRwRkRaVL+
         sWyozQVcdH8WqSxqkwQALxd4IywkXqOEST5mdgpjbYTt8lDOJXNKdhL/qZIOQKZp/c/V
         kmNLRsvmQXt4WhsnHKmsf5MOf/j3MjWdANjti5nXQ5BGDZActL1frqX9L2bGeRbzXl2Q
         nN2sOPQnZl202yypiQHeJNIkj48KuA02xjSJS2sFpWXWPBzGb+Nxq0roFgohSGzx8wi6
         v3SA==
X-Gm-Message-State: AAQBX9fjyzeD6vJaSeYMw8WX+AwISt7WYWefyioCBhwssfuUdbQiZrL/
	A2FYM959dViFSHfaq9OktfYs0c26g1Dwn5qQuF4=
X-Google-Smtp-Source: AKy350a/MDZEdFquMNruFsfiIdHNSmiDjW5khv2c+3EheVH0PNILA4FW8AGtniTzvagvyHWYVpCHPg==
X-Received: by 2002:a17:903:3093:b0:19d:1bc1:ce22 with SMTP id u19-20020a170903309300b0019d1bc1ce22mr23992076plc.5.1680287251852;
        Fri, 31 Mar 2023 11:27:31 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c20-20020a170902b69400b0019f1027f88bsm1826795pls.307.2023.03.31.11.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 11:27:31 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: linux-sunxi@lists.linux.dev
Cc: conor.dooley@microchip.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Conor Dooley <conor@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Trevor Woerner <twoerner@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH] riscv: dts: nezha-d1: Add memory
Date: Fri, 31 Mar 2023 11:27:27 -0700
Message-Id: <20230331182727.4062790-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add memory info for the D1 Nezha, which seems to be required for it to
boot with the stock firmware. Note that this hardcodes 1GB, which is
not technically correct as they also make models with different amounts
of RAM. Is the firmware supposed to populate this?

Signed-off-by: Evan Green <evan@rivosinc.com>

---

 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
index 4ed33c1e7c9c..6aba68cf5541 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
@@ -32,6 +32,12 @@ / {
 	model = "Allwinner D1 Nezha";
 	compatible = "allwinner,d1-nezha", "allwinner,sun20i-d1";
 
+	// FIXME: this is temporary.
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x40000000>; /* 1 GB */
+	};
+
 	aliases {
 		ethernet0 = &emac;
 		ethernet1 = &xr829;
-- 
2.25.1

