Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52527E0
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 06:42:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id qn6so8579836ejc.11
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Aug 2022 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lJ8gBapU+3I/Fz9LZ5favwJM0YfdvqXAjWYrlqgEVg8=;
        b=oFcN1jtJrAWrkrsYs75dkC5rJMcPYnYciSlrMdc1Rey/o0vE7d5G//ei161GnZSXul
         k9M+DS7107ymze/izgVzWbnS+7ahP4B66YoZch0Baq0kaEw6DIVmiDKHthUPGCXdb5Na
         3GtKHI/411yTNFHU3O14PEzhz5MBPvqSXvUAMWieKFLZtx1s7lxDs59uoRJzetPDnzmc
         6wucQnaX50Vpzkp5ruDqNadnmh3jzfR/9yyspCMh4N9Ueju1ZXEEXNBMgNY0lULHmqER
         OHC6dkRzZ7EhIuNDIQxR4LZvTk+23OrzNHOJQa+UlE26dbTwHEBAOoM8DgXkV/1G1ZC+
         zQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lJ8gBapU+3I/Fz9LZ5favwJM0YfdvqXAjWYrlqgEVg8=;
        b=ngGGZmCh2u94DqDInTG8EmNVt2kMogbz6FgPrtxsUJKOSgJQV4Zr9tqkQyS7skZn/m
         lg4FrGsYi6c7XKpZwA8H1NRRnnm/59it3gnXoWMlnU2cBeOuuHVkwiKWu68Si33w+VkO
         QJ08Jr/qOdx7q+MqC7qlRfiE+mURMSuek7ACbQCrW2epEPQvi+doUocGrAyGURKjv92F
         mB/oCH2Lc8o4/Zlja4031sYgKMTaxvMeUXp7OfhMOCeyj6rFzsTwOA7981E8MeOfwKn1
         ZT6ODpV6tMFZcROuEbk1K/IluKGhsDKeCxo0kKj1XhoO8Mau3tHM2EsXAO2iW0RejNBH
         /i2g==
X-Gm-Message-State: ACgBeo1afakLkYO9Ej36b+m5Fn091tNeVRpirKPcTtfUqfM/Fc3uUfDo
	cEK08OUFfqqHu6AidEiUlH4=
X-Google-Smtp-Source: AA6agR5um22tR+AS4GkxN7UJD+cDeqE1juTpQYbU/f5aBXd87Mexe2YSMRmH3Y3s/wv4uZBA9Cn7Lg==
X-Received: by 2002:a17:906:8a6c:b0:730:a322:6f69 with SMTP id hy12-20020a1709068a6c00b00730a3226f69mr7027005ejc.585.1660459361130;
        Sat, 13 Aug 2022 23:42:41 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id kw11-20020a170907770b00b00730b5a35288sm2602982ejc.214.2022.08.13.23.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 23:42:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/6] media: sun6i-mipi-csi2: Add a Kconfig dependency on RESET_CONTROLLER
Date: Sun, 14 Aug 2022 08:42:39 +0200
Message-ID: <2640649.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20220812220045.800820-1-paul.kocialkowski@bootlin.com>
References: <20220812220045.800820-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 13. avgust 2022 ob 00:00:40 CEST je Paul Kocialkowski napisal(a):
> The driver relies on the reset controller API to work, so add
> RESET_CONTROLLER as one of its Kconfig dependencies.
> 
> It also selects PHY_SUN6I_MIPI_DPHY, which depends on RESET_CONTROLLER.
> 
> Fixes: af54b4f4c17f ("media: sunxi: Add support for the A31 MIPI CSI-2
> controller") Signed-off-by: Paul Kocialkowski
> <paul.kocialkowski@bootlin.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


