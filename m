Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505D211468
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439674; cv=none; b=nIXBjRrTkkueKMfiIfVOnDDMD5Y1YSoj3bfXK3XNYuLIWSzXdkTUn+ue8LjLixAQPa8YaE8mjGRvOPi3D6zFPadF5+L6+i9yW+ezu+PMZGo0GgIo88V7wMXMw0NT1L/KcDgXlenjNcUgnTA+yBBE7zX6GOyBuiXZ2PuvFsHrFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439674; c=relaxed/simple;
	bh=BHjvuHtxcGbYTJxuDTg/fs/1zRBNwMIIEfEqMmhl7qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e681i0qpD3Yy3E0UgC+N+jYYXYrjnSjlklrGxCHxf2vQlnjkVzWufcUo6EDRzVO6KwjG94BzSup6pWCwhEat7hl1zWEJ8K1SrucQhZvekNMdaQRDJwTSFvjp9wKjwGIvQaG/1EdX5bROflTzYfQ0AEI0YTpF3VdYAO15Rs/dH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJqeHeF+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJqeHeF+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5451d1d56a7so738182e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 01:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439671; x=1740044471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=nJqeHeF+uKnBFeitbYUTV3+LOzJS7s4MUAjxU5z/zCOZFt8/6TDsF8H6rLqiudAYhB
         VcZG/AFS+pg9c/Y8dkKChECwcUpbwtC6TaTszlFnCKb4F5NjMqoQOmyUi5lnW3cEztkE
         l9HYo6zCwldavnIrrxLpbYzpxK9ePmWTFZDb37/8dJEKGZyGETZnAvIZl5mNwmoiL3N1
         8GkdcGVMkISzTC7N68ihQBWr8lMx4bW/kF4+xqwR20RopMhp0JY9/2rgxh0CwdoW6Pwm
         295kmZ3fPUs2QAgUbiIljRFKt0p5txPX+mSDSmkdDQVK+0IbgrgW2rKVHEi8NEA8Nd48
         2Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439671; x=1740044471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=hc639RhPH/NNS/cUv9u2pa8/Kc54DSu7Nwg8O+XncnLyF2X1MshC8C2m5d7LxenMCz
         YXgvY17guUKbltIuKrfpmKqv1EOrQ8e+WSrhuJRa7aaMwAXLdWXCb4oHGdgaqmd5mm2L
         vlJYIDCFqtKib4qHlE7z3YDRZvbHQkrujEYwDSdzwMzp4VyVKMe4Ezbc85hQhIVR60WE
         LDbZdix+UnvN+AqNz6l34lu741GfrZp8iUWqY9nFExblLroGFd6itZk9OuKYBpK617Od
         EhLRUX6bUQQX7/2AG3TqDQHBU8x/bZcsVuIeurzfmXNZGJfjPDNi7ePCWj1mdCeAYKSx
         25Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUFLwGALu8B7uBJOkx8ITSyFzqLAjtyarRYH2xYQNOAOFFhYOytfJbQMSZzTHrIQzBw9+OM+i7mgm4LkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxSLKCT/FAsEVUmAWh+ymo7G8iyKHAa/PDv3RJ1AE2kc6L7KiC
	WXhOgDNYtNS+Wuv6szMmvcUrBEkZ0G3YMDolfHVrx0pHfnyUEbY=
X-Gm-Gg: ASbGncvsMyIyRYVm/XaE33Em9yny91aYNhU7zosu8F7GPnfG0xNwEbI9yhxodd5pbU2
	RhHv4KHiagxfSABzluYYhaIH4ooQmM3HmZKRwvg01Yg4+9xrzp6JLqMYujSkib/65hwY42/HVPM
	+EeGqJo47yNu0PdlpzJErAwhyyzH3zkoj8Xbs2NSKspyq5fKihj0/dpAZHZxKCc8H80O5oDqt3d
	nJlv0nDcJD+mjv//TjRn0sZ2/pcSU6COITNRSzNfTrIpARakOHI/XfRtBp9IkTi1A+48Fk9NJwG
	/biKn+CqUkPN0HQ9Yegw/GKne1I3bqo=
X-Google-Smtp-Source: AGHT+IEU1Xe2lAmPO6iNBTAj5sggwrT8IjsKe7vRboIZMPv0WTY0Zwji2mjdrlZbGMkJm2gu+P6b7Q==
X-Received: by 2002:a05:6512:3d1b:b0:545:8f7:8596 with SMTP id 2adb3069b0e04-5451e5080e4mr706332e87.17.1739439671065;
        Thu, 13 Feb 2025 01:41:11 -0800 (PST)
Received: from localhost.localdomain ([178.176.176.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cae7sm119518e87.183.2025.02.13.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:41:10 -0800 (PST)
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
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 13 Feb 2025 12:40:14 +0300
Message-Id: <20250213094018.134081-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213094018.134081-1-privatesub2@gmail.com>
References: <20250213094018.134081-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028d..2c26cb8b2b07 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1

