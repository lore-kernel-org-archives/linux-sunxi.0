Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8525D15ACC
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilQoYmmY"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-550dd0e3304so2210493a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 03:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703243705; x=1703848505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BvelMzmtyu1Sqb0MGaQ3BVDecc44IV/AoEGKsA1SR0=;
        b=ilQoYmmYjhos0nEMO1Zes7SI7d6hxBQU9ZFVgtxWESUOpQXHQxrSucF931FYu4HlSG
         TBo/MKoYFGAuHoJgnjDd01D0K47YExOjmVcfU7Z+SiETniEEMOeQItw7aq2h3KDB58uq
         8WqcIAVv5nxfM27xbmtDkE2RvXAWY5QHzA4/FlfB3ZNg4rYJ434qGvxXtwa7/YOh6GaK
         jUHhCFO+vmgzhiNq8oHIPheuxFTWhhWyd7FdW5e7KqfxXei0TodnUEbtBSt096FG8lxM
         tFLljz10R0RBscoC0FCiVCWI2sNQqgOQHjgVPVJfP4dD87noaALF3n+idPIteJtQnV6O
         mc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243705; x=1703848505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BvelMzmtyu1Sqb0MGaQ3BVDecc44IV/AoEGKsA1SR0=;
        b=QmDkG10WpDyRZ/A+n9oVMj6HI3OGu4XGGDghToRhY2Flmf+LLEhJNn/cj3a+hYMmS/
         0KJZf/dC1IWaTZGsgua/O/le76gBGES6QS+vXZpeRksbKkU5nmpNp+nb5t7nns6iZROc
         7vUlip8wCqNK6cEvEa2mE+Mrn6AQGgPQzAZr2je7ij+UQvXd8HPlSvUfUwiRXJc/iHCK
         VOQfysibr3OuNiyNAtJsy9bYzb9iXJ9DQiWWnpyA7+DOZDsZeKt0HQMGzlMgpOeKFRnS
         et4BK/KAsIaxvdlmxUCGNuMhmCPVI2R5SqQsXH/8BnDaBctmuUmG7M1AngcArgc7hCPz
         Wk8w==
X-Gm-Message-State: AOJu0Yy5ZlkGm2ajXQBlXYVJ2lIUF3Pgv00MKgHsWfzhlLBpwmjD0NX8
	bk4PlTdcjeh+D03EfiQFUEQ=
X-Google-Smtp-Source: AGHT+IGWir11b4gGwRl3NO7lj7pMTMBbWgNmeSbRuM9TWOJnnwaniRMrtaZLnxpLWHffPO330BSmbA==
X-Received: by 2002:a05:6402:124b:b0:551:ab9e:53c6 with SMTP id l11-20020a056402124b00b00551ab9e53c6mr575373edw.52.1703243704565;
        Fri, 22 Dec 2023 03:15:04 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.91])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0055267663784sm2420469edb.11.2023.12.22.03.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:15:03 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v3 3/3] riscv: dts: allwinner: Fill in OPPs
Date: Fri, 22 Dec 2023 12:14:07 +0100
Message-Id: <20231222111407.104270-4-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231222111407.104270-1-fusibrandon13@gmail.com>
References: <20231222111407.104270-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specify two voltage ranges, in order of increasing stability,
for each OPP.

Also define an nvmem cpu speed grade cell of length 2.

Link: https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133
Link: https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6c..7e2e015e0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -39,16 +39,23 @@ cpu0_intc: interrupt-controller {
 	};
 
 	opp_table_cpu: opp-table-cpu {
-		compatible = "operating-points-v2";
+		compatible = "allwinner,sun20i-d1-operating-points";
+		nvmem-cells = <&cpu_speed_grade>;
+		nvmem-cell-names = "speed";
+		opp-shared;
 
 		opp-408000000 {
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <950000 950000 1100000>;
+			opp-microvolt-speed1 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <1100000>;
+			opp-microvolt-speed1 = <950000 950000 1100000>;
 		};
 	};
 
@@ -115,3 +122,9 @@ pmu {
 			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
 	};
 };
+
+&sid {
+	cpu_speed_grade: cpu-speed-grade@0 {
+		reg = <0x00 0x2>;
+	};
+};
-- 
2.30.2

