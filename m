Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21D92FAF
	for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 07:26:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o127so12242368wmo.4
        for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oye/WdclhJDwP8mPkPCr9y4H1Z7zAK3xEJR1qvBeaso=;
        b=GDjzLdq47HCYuvEWQ4b6OsetImXmuisYOOQ/Cs2rqsaU5xIMzazg2ZyVBwVtTwtfAc
         TY9bP0852THvyYYutJ6qFm3gMjrUSVc87+YlBbo2Ev63mhbk7tnS4QfU1QvM3roGOSjF
         v6wxwxgH3o7gAah1WiDaXISCEqUFjNPfc9GHvHkdg6TKZB9lbg7QiOlyugIg3ZJFVDv/
         MVPgSrdfhuw+XDjQHV9xlL4bOqWmnM+1/w+e6/1r3+0YPuTPZfaj8+cURvmNIjcwM193
         LAyuN5P2YjXc1TR6UUyBwk/M7GJ7oOUDlLXDNLvzU1BwvuSchXJoDEL+OAn/Ipn910e4
         ZnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oye/WdclhJDwP8mPkPCr9y4H1Z7zAK3xEJR1qvBeaso=;
        b=Yy1OyOEgUtgJWUeNHlNq4uQJSIvHTW9/CUBl45uxAb7n+9ZQ5WRWzI+l/1J64wOqRk
         GVj2L/1FxMJ9o/1z+1rcuIlRtoqw7MaQw92qyKUZCxiDXGsWiPUqPCoiA7xyvhBtJjcF
         UHBwK2OibMPZYmQcK58BqwrYTb70pWYUWiy/Wg2dv4jO/37FphVuQuyInij+4l7OEe0c
         MmT4fe4Lwmejo6/bJQKr99phS52dbLg18i9P2HECvY5o4VmGbpwi36mr+qb0O1W7kILx
         jnqbHJtc4Axb3z7I5eR1/BZ0HWr0xNYcTTgKg3C0V9HiT7RWIkulJqKbReccj1YUZC+a
         vwxg==
X-Gm-Message-State: AOAM533dr8QwhXMZg7SghFUnmhQWVjp4KCzlf9pZzMQtFWSJLw+G/VgR
	+wuafvEpRxaPYCe5O64Rh6M=
X-Google-Smtp-Source: ABdhPJzewLyrbdH2kx6GO+S9lB4qsB4HBQ/ZQpVFtt7r3rnL9WrC1zhP3+rIYl4JM/D/IIEo7ShgJw==
X-Received: by 2002:a1c:49c6:: with SMTP id w189mr11727864wma.108.1621668373488;
        Sat, 22 May 2021 00:26:13 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id k205sm1781849wmf.13.2021.05.22.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 00:26:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 04/17] rtc: sun6i: Add support for linear day storage
Date: Sat, 22 May 2021 09:26:11 +0200
Message-ID: <5920087.Glgd6ahW17@kista>
In-Reply-To: <20210519104152.21119-5-andre.przywara@arm.com>
References: <20210519104152.21119-1-andre.przywara@arm.com> <20210519104152.21119-5-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne sreda, 19. maj 2021 ob 12:41:39 CEST je Andre Przywara napisal(a):
> Newer versions of the Allwinner RTC, as for instance found in the H616
> SoC, no longer store a broken-down day/month/year representation in the
> RTC_DAY_REG, but just a linear day number.
> The user manual does not give any indication about the expected epoch
> time of this day count, but the BSP kernel uses the UNIX epoch, which
> allows easy support due to existing conversion functions in the kernel.
> 
> Allow tagging a compatible string with a flag, and use that to mark
> those new RTCs. Then convert between a UNIX day number (converted into
> seconds) and the broken-down day representation using mktime64() and
> time64_to_tm() in the set_time/get_time functions.
> 
> That enables support for the RTC in those new chips.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Change ^ to Signed-of-by. After that, you can add:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


