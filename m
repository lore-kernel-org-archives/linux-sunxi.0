Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9084C19BB1
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:15:16 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so6624565a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686593714; x=1689185714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiUkkPofbp18WToaxO3U7ArUdrHHLUzAkU0DJhMfi3k=;
        b=lURXcPZt8jdQVsTPGHOPCKHc9UrFHPeDScVDCHVugisRt4tqRMOk3DPkVMC2/BzCkC
         wAfPYQWQFynx9eLL5WQTWF+AQSYwQpPECnJO65fOPll+bJv2kH8YSY70VmN8lANKi3Gk
         xyzDnZl7PAk4QdyvMjYDJUzlpvbiYCh2wvvIygtgwQ2oev5HSIyuCYZD9AOBMU1AWHZA
         +zuQ/NKLITTbSnC6vpalqZLu37MWXycjzGMmTOx1opGKlQnTmm3v7twsMVwj/FxyP5A6
         YMKyzwcw3CJSnjnLj5ZWhG/ubg1BSZQ+HH1Sd12qqWkFcz+M5DgUIReAsJzMxUk0Z3BT
         ukVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593714; x=1689185714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiUkkPofbp18WToaxO3U7ArUdrHHLUzAkU0DJhMfi3k=;
        b=QPx+EmCbvpPqD+84PVr+ArW17dM45/5NjW6F3bX+cM5+9HeDkAMLmyGAqY20TTCxQh
         xQyRGtWpPY7zvvPhnsISey10q1w1du0cSGp14R7UWcMhW117abIDka7e4VZw5BrCOGgZ
         H1YOU8zXlPE991G2Oeodtta2m8ayJoIF5XzpIs6cWvDhHEbHXlWcJ6VBzYd+6fQhL6v/
         L3yJhuQK1JOi3owop+EHlVa4Bw/J1qE6Pb4xQv+SnMXuzwSYo05ScFYnIYFSXmEt7SoU
         FMw1DZ+d768i9lJf7ZpRhIP3s+VntqYuT9DSp2er7en/Dqv2cH9ESaj+NVXmhvPqIrx5
         AqjQ==
X-Gm-Message-State: AC+VfDyKswg+4tPZJzsZfwJbJ9mwg6cJvrEppyusKz3zVEfDf7xw+4NY
	VzFRKOapYa4c7NHwB3AzTSo=
X-Google-Smtp-Source: ACHHUZ52JwJgavwtmj6uIUSl9nbwUF4Q1elpwO9wAdRAbA3JUXkMfyUlmPZnsNLACdVo2JZNDzfNVQ==
X-Received: by 2002:aa7:d397:0:b0:510:ee0f:1eab with SMTP id x23-20020aa7d397000000b00510ee0f1eabmr4440101edq.41.1686593714421;
        Mon, 12 Jun 2023 11:15:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id m10-20020aa7c2ca000000b005184165f1fasm1331880edp.5.2023.06.12.11.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:15:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, Sam Edwards <cfsworks@gmail.com>,
 =?utf-8?B?6Lev6L6J?= <luhux76@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 6/7] phy: sun4i: Add H616 USB PHY support
Date: Mon, 12 Jun 2023 20:15:12 +0200
Message-ID: <4834451.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230611233241.14235-7-andre.przywara@arm.com>
References:
 <20230611233241.14235-1-andre.przywara@arm.com>
 <20230611233241.14235-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 12. junij 2023 ob 01:32:40 CEST je Andre Przywara napisal(a):
> Now that the Allwinner USB PHY driver supports the H616 quirk, let's
> enable support for USB ports on that SoC.
> 
> We connect the compatible string to a new struct describing the SoCs USB
> PHY properties, and unblock the PHY driver selection in Kconfig.
> 
> A later patch will enable USB support in the H616 boards' defconfigs.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


