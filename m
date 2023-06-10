Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222ED171A4
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 14:17:59 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso16792575e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406678; x=1688998678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18qfsJwML2WETjitb+8UZsh0CX3sJjeHPfRntT1ssOk=;
        b=abCNud8TN4GuZ1vG0H87kyReB1a7vZKcnWUabKUl5jvqkBI2yUIZ+h9NyEJUEZ6yEp
         +pkbu/a49F5nmgMTiFyYwqMmyP5ux/Rdy9taVXcxiv6x2lonN2uANfH/17dqs60qTJVG
         NP3s91IwhV7Lt5gOTpJqDYRmz575uGPgQ0MQB8SUYGn9atOsbrl6JSoccUUGD6RYoBci
         fRTgIMe23VO63g4SDYjMnwntzBFLriTwbLWqOYMxTGQ5UHBlwr9yTWLfvcO8yXN2tIZq
         nfUojlEEk+RGZK2aUmJz6clRyGx+6/E3p6rutPQbRujWPlTBHtWRftCo/hZ82Auf5QRl
         mIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406678; x=1688998678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18qfsJwML2WETjitb+8UZsh0CX3sJjeHPfRntT1ssOk=;
        b=ig5iWP3WSUIyxJbj7j9yqDgSm0s0uTa0R0p9Q4PCTkan5xwQq8XcQboEVNgKXOWXTB
         qJNX52u4ujvVvZ1sHPAdcgkIvKxIesghdl9b3k7lQKBYy2yeWH9zBZ+JLVzZD23fHGY4
         H9JnnH0oWaXf8Bjc1pR+ahPdNKJbAgaFlJYdZ+GTIZd8VkFcSAuPAFR3zLGRuRfhHd7W
         +Lpgo4yj7/eYC0Mn/A98ylcKqiRsecAF3I4URjGlr56zMfzpTAtYDl3HitcXi/2yw/B5
         qoUBY/9pS5wzJ6yVpKc+ZhWFpfvYfUlla2vJc6yi4LVd14pzbDKHjQ5RbKcCw6CO4DBs
         qn5w==
X-Gm-Message-State: AC+VfDwPk/GsLfy4Giyqn91V9K4hrOv+LTKJHZsH5Dwg3jWPo+mxk21t
	dcajdbYrsRLQlXfkt5tpWM0=
X-Google-Smtp-Source: ACHHUZ5YMqHGIZnwmXgTpw+GIEM8hWEPiU7hk3r0PV6Gw4QXYai2MKh6r6WMLxMO74CwCTZ3ueTXKg==
X-Received: by 2002:a5d:4090:0:b0:307:cf71:ed8c with SMTP id o16-20020a5d4090000000b00307cf71ed8cmr1170279wrp.35.1686406677900;
        Sat, 10 Jun 2023 07:17:57 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm5841488wml.9.2023.06.10.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 07:17:57 -0700 (PDT)
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] Add D1/T113s thermal sensor controller support
Date: Sat, 10 Jun 2023 17:17:31 +0300
Message-Id: <20230610141739.999268-1-bigunclemax@gmail.com>
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

Maxim Kiselev (3):
  thermal: sun8i: Add D1/T113s THS controller support
  riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
  dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller

 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.39.2

