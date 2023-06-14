Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9FA6FBB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 12:55:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30c4775d05bso4802694f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 05:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747341; x=1689339341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4a+nqynai93p3DslnYapWoLBaBt6oixAJaqzvjoA2A=;
        b=O7bqwRo9lqTLd0GymqyDJ/F7I5npZ3EjGhqdc8H3z76pJF+lG6ctgHpTwrGS13GdeJ
         7/+hPgUpA7T81p6dBhiwsmDmSLI6YRtANIy5njh4PLpnZFxoVlEtMM2jCZpGI4ULOpws
         lbZy49S4H5M104U/AMIj/GdKhxXCOX2/DYD03RarZYLu2D2saslnN2zqChnZIGpUUCr/
         5laFVT1VMh6J2ECV7iqvALDhM6ApBsXH3ElHD4cuypHY2tURBT8rcE7Fe7vtBeDT6G9u
         aByQdm+gWh963O0oAxOTS97kALwPMyubxCNNW7EGWRpz2OlqLbaNogz987Mvkv3xkHDn
         1uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747341; x=1689339341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4a+nqynai93p3DslnYapWoLBaBt6oixAJaqzvjoA2A=;
        b=R2f+fOLlmHEBKrHBbcIjRPn0UxlzBEfVZMvEOM81tDrfDw8MCpZ6xmcbEKWJ71Ldgr
         f1aBxPTo82o9+gNfHISyp6SuB0TB4rFFHl04NVI6q9GXZfaZRKqZl8WooedA3L8csdZ7
         rt5ygUKgAHiIbstzQYSRYxh+tRuiPT9IYT7eWMTsfgiNRByyslLhI4537YK25I/Fnj9u
         MSTN1pBn1wVvPujaShYWoeFVLdJA9H3GgLU7/z0sy6lxhyQOLm8At3nj613ist/iCSUY
         SjICQ8CVXaDLjTkbMvMibHKokEUGJ7cckCbxeOq3GS7gRjqiJEK63oulhTuvkHgVfnUq
         8enw==
X-Gm-Message-State: AC+VfDxt52ha96BtwVPZiR5kEPoySPWf0/Qk3ersbUeNtdHAB6Ey9yoD
	394IiKRFvw/SN2KoCyFJiiQ=
X-Google-Smtp-Source: ACHHUZ5CgQtLa5Ylyn328rgorrSA/Y3m894rHJvNMi4kR8Twg1Hc7ZqF2fyloHx8zTEu2k8bZ90qfw==
X-Received: by 2002:adf:dc42:0:b0:306:28f4:963c with SMTP id m2-20020adfdc42000000b0030628f4963cmr9087095wrj.23.1686747340807;
        Wed, 14 Jun 2023 05:55:40 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:55:40 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] Add D1/T113s thermal sensor controller support
Date: Wed, 14 Jun 2023 15:55:18 +0300
Message-Id: <20230614125530.660597-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Allwinner D1/T113s thermal sensor controller.
THIS controller is similar to the one on H6, but with only one sensor and
uses a different scale and offset values.

v5:
- Dropeed 'thermal-zones' node from sunxi-d1s-t113.dtsi

v4:
- Dropeed DT bindings example

v3:
- Fixed SoB tag again

v2:
- Fixed SoB tag
- Moved binding patch before driver changes

v1:
- Initial version

Maxim Kiselev (3):
  dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
  thermal: sun8i: Add D1/T113s THS controller support
  riscv: dts: allwinner: d1: Add thermal sensor

 .../thermal/allwinner,sun8i-a83t-ths.yaml       |  7 ++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi      | 17 +++++++++++++++++
 drivers/thermal/sun8i_thermal.c                 | 13 +++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.39.2

