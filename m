Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40C68
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Nov 2021 14:12:54 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b1so26446786lfs.13
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Nov 2021 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Or4AgXyW4tgl2yKbvbtrdnKt4RJ7VfsqFDnQl/vuTc0=;
        b=7D2x6Zw+zQCe/b4dFMjkLMGeg/ONrzRoCRRyI4h5ma2+YlV7tsKBCBXfdu9/h+qudn
         CA20OmsXGnLzEE6YvRwLEf3bjOqtMKU+PTQZYoUkfhF1lsOjDNPq8oVedIZwyz4xRx0t
         /k+uYxAW7Q2Bi8noo4cJPzB5XfpPqJL3pr/AYW+t47Pt/VhcT+TNtxq7TvDyH+x8rVAE
         l4wbFEP2yt/6AWekU5uml5vvNw0E2xu08mz12SzqB7PnNNtEoRUvbzodoFHHI8q5wl6j
         Gn/LSbKaPx0hyA85wZXz2JpeJLD8xR8anrxpRwMcP2HGWUav2z6MIUhIVfcUS29m+xFh
         TQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Or4AgXyW4tgl2yKbvbtrdnKt4RJ7VfsqFDnQl/vuTc0=;
        b=wgbUjuRrbAjLFe0Ohzh4v4CG2KzFDQ8tCOedyHbFmhgTjTbLpFeL763UBDPcgxLCF7
         kunj00+ifQKGu7WJWhwTt3SlV5pVaNYgMuPqem4xTVymKiXNdY5LgPr9wOok/Z7Pkp26
         F81+rzE/0liyiS4kKpFnipqyv+97Aq78cpi0CtWBbN61dL91yV0OjTBMHYPOsSAqgAez
         EAASuSEIe3lsY6eLQEQTxOE3xcVBJqhmJG64/jnzPpHRov+xnaZMCHW6tmlcWOzrnw3A
         +cJcLSDM4rrL3yoE7xBmtGUSf7fwY4KQrAc8ZDoJeuNb0DVvSNi7AM2BdYrtoQnFPnAU
         Lufw==
X-Gm-Message-State: AOAM533EF4O+IvLHfJalGWRaSCS0U1a6x9MfXgqNXwIBU7iEgiuGFyoY
	iV77IZpE87MTxiu7f78GENpYy0OSMKQNzQ==
X-Google-Smtp-Source: ABdhPJyghWKlwD40NYXvO7Wpmo/rE7eEgxm6PEby+PI/2Q5Arc3dROddVEFwY23331mAF7yf5pEk0g==
X-Received: by 2002:a05:6512:22cd:: with SMTP id g13mr23684891lfu.417.1637244772797;
        Thu, 18 Nov 2021 06:12:52 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id s15sm193634lfp.252.2021.11.18.06.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 06:12:52 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: linux-iio@vger.kernel.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Quentin Schulz <foss@0leil.net>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] iio: adc: axp20x: add support for NTC thermistor
Date: Thu, 18 Nov 2021 17:12:31 +0300
Message-Id: <20211118141233.247907-1-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most AXPxxx-based reference designs place a 10k NTC thermistor on a
TS pin. When appropriately configured, AXP PMICs will inject fixed
current (80uA by default) into TS pin and measure the voltage across a
thermistor. The PMIC itself will by default compare this voltage with
predefined thresholds  and disable battery charging whenever
the battery is too hot or too cold.

Alternatively, the TS pin can be configured as general-purpose
ADC input. This mode is not supported by the driver.
    
This patch series allows reading the voltage on the TS pin. The voltage
can be then either processed by userspace or used by kernel consumer like
hwmon ntc thermistor driver.


Evgeny Boger (2):
  iio:adc:axp20x: add support for NTC thermistor
  dt-bindings: iio: adc: document TS voltage in AXP PMICs

 .../bindings/iio/adc/x-powers,axp209-adc.yaml |  3 ++
 drivers/iio/adc/axp20x_adc.c                  | 45 ++++++++++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

-- 
2.25.1

