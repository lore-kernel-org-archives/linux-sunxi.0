Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B00481DA
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 21:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+3AflH+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c236624edso26713895e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 13:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847348; x=1703452148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lQ9koqM5HR+VAaH2z3fBKlko6ZAPGMVyn6jm18Px/Q=;
        b=B+3AflH+WBb4VGk0p08CzT4Jnicus4aevpLV61stSl6Dc/VbRSKr1fNA+y0QIiZ/9V
         hXoA3U3J/MNO/lm+J17mr+RhUuC+U7NjPNlJkELXgiwyEBJ4zVLZk470oYBQnu/TPaoI
         OZKeh2kBlgNLbJXs2yhqm7UOL5HJcnsE65Ih0cEv2+qUCSAWYIlBi1HgVVvmbC3HZym6
         NYNnO8eoHPkVYiM2vz2rP+EWSi54+Prd2cXHWwxpePL36Ts3eIom25/k95ijGx2kz29t
         +Kh0jBm+sZdxEA9BC3ZQv5cJcqlEGhpxvLbjI1Fg4Hp2n6klut7aEF+ufexNDF+1o5rX
         ljZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847348; x=1703452148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lQ9koqM5HR+VAaH2z3fBKlko6ZAPGMVyn6jm18Px/Q=;
        b=vqBVZ/6MhWzmZVHA2GdOEZkwVp2ou7g9V1I0cQfczcQGNHd/vIfPSXqRqV22KYuFyc
         dRMQGO1/Ow7rqZE/L0isZWrzLBVx7mqTHSkqG5gxFVzuwqWvpqwnsNByuQsNSoeD/55p
         +T2Wb+RfvBL+IwNEsEaimWHCoXgTnYj73PC4eFtOmO8bs3J8Vx7RyD1qcAxaEWI5MiaL
         ZJkCLrqT4rerSyNGBOmfO4hrvOeA9Te7RMiIu3hruOZoV+b342OYFwaZwUKHcRodbtMY
         UEWUYWgvYK+F9lZaVnlkH8NY0e4vnBh6bxmVW+pew6vvSyBmI5l1YxvV9EYU2iVS5AIJ
         zA8Q==
X-Gm-Message-State: AOJu0YzGkdO65cUEJkuDsoTIJReLRUJ2/kAJLhZCIA1rW0V7KIe3sJ79
	WXREcgFaayrJ2U9tIu8aYdw=
X-Google-Smtp-Source: AGHT+IFq0Qw5BzSy9IiEeWETEQaj9PyBVqQP8GjxQaaABXzR63EQjYWKJ9bwUsU+wJyPcCO0JSj5ow==
X-Received: by 2002:a7b:ce13:0:b0:40c:3820:f002 with SMTP id m19-20020a7bce13000000b0040c3820f002mr8188560wmc.94.1702847347408;
        Sun, 17 Dec 2023 13:09:07 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:07 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Cc: Andre Przywara <andre.przywara@arm.com>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 0/3] Add D1/T113s thermal sensor controller support
Date: Mon, 18 Dec 2023 00:06:21 +0300
Message-Id: <20231217210629.131486-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
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

v6:
- Rebased onto 6.7.0-rc5

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
2.40.1

