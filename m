Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C097A
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 18:10:23 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id r24so1998818ljn.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+/fNrvR6GwZ8c8YWG9lTH0YkPMhs5Zw4U+ZGkVdcAM=;
        b=csol2+zB7qY3JF+yTeDZ0Lrhzd/xNv0oCRPZzdkt8+IfGX/OfCEy6B84HipwSbpBWy
         62yeQqvhw4t/ZD9q7VZrC/D24j/DyHi4+PvFrXs6ghKdQz1Mit5UonIuSRmZlmAD7gxk
         XBxezIliiR+J5PJ2ecX8KqifFOACUtiy9MUdeGUAPPUjajAHU3iZVAD3P9UpMVOYsRKj
         3BkK6HDcm9x80Elfx3AZ5qdFlb0nMqlYtrGRgoEl3BBTV/hTArxThbyhhCdrk+UgrThY
         Ut0F9a1PiCqXeOJ9aBoNfekbC5n2jFAQ+KImm9ruD8d9aYxQKioyYGfeX1w0p1j0YjFO
         Gc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+/fNrvR6GwZ8c8YWG9lTH0YkPMhs5Zw4U+ZGkVdcAM=;
        b=KWuHoUYsE+vO1wvOZl8nCjRjxEE6hxzAZ0ozO9XiEShjbMBVJnh3/ZHKwZunPJOlcz
         8Da2RbWbpcDjYVUzHgAGvX6u7ptXqflOW6X/M9+EqFkWZdyOFxYO6h8Kx7Jjs4nTqNJa
         7Gbf/lgEe8eFdEhAZs5GFl3wiEjIcOheA/8BHQKtKmbtoHVkhR8WfPH+fMle9IQvFQMK
         fAT5zkbJrUaxXkXKjjFv+Q3ut/lwXRXIJL1U4MXg5riMTDjBe0+5RjsWH9yuaFCyPS+t
         tGnFBNKAY4e9yLXWrcWiNIEc9Bfgp57leihUu2JKkAuin8kppZ7jaIyXOECoAfLeTRhQ
         gE3Q==
X-Gm-Message-State: AJIora/jquHNc5DAVgsBfCUuUKAMT0c5JWIB3QtWhGZx4fPW6g+20xKU
	VxjYuU3dyDWhhcHiLqBD5QI=
X-Google-Smtp-Source: AGRyM1tYKRUJACE5ehnNU7j1RvNs+JaMXWCKiFa/iPFW1NwX/EkWTbXrTeY7Pvl60hDbxizeOP/1yg==
X-Received: by 2002:a2e:8805:0:b0:255:6e73:9a67 with SMTP id x5-20020a2e8805000000b002556e739a67mr533835ljh.426.1655316621255;
        Wed, 15 Jun 2022 11:10:21 -0700 (PDT)
Received: from localhost.localdomain (ppp78-37-196-203.pppoe.avangarddsl.ru. [78.37.196.203])
        by smtp.gmail.com with ESMTPSA id v5-20020ac258e5000000b0047255d210fcsm1880716lfo.43.2022.06.15.11.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 11:10:20 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: jernej.skrabec@gmail.com
Cc: linus.walleij@linaro.org,
	mripard@kernel.org,
	frank@allwinnertech.com,
	andre.przywara@arm.com,
	wens@csie.org,
	samuel@sholland.org,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
Date: Wed, 15 Jun 2022 21:06:44 +0300
Message-Id: <20220615180643.299586-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8939552.CDJkKcVGEf@kista>
References: <8939552.CDJkKcVGEf@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi!

Jernej, sorry to have kept you waiting.

On Wed, May 26, 2022 at 11:52 PM Jernej Škrabec <jernej.skrabec@gmail.com> wrote:
> You didn't explain how issue manifests. How did you find it?

I noticed this problem when tried to pull-down a pin at kernel 5.3.11.

sunxi_pconf_set uses sunxi_pconf_reg to get offset and shift.
sunxi_pconf_reg uses the next functions to calculate register offset:
	sunxi_dlevel_reg
	sunxi_dlevel_offset
	sunxi_pull_reg
	sunxi_pull_offset

These functions calculate the offset relative to the pinctrl address.
Let's consider the sunxi_pconf_reg's output with the following arguments:
	pin = 354 (PL2)
	param = PIN_CONFIG_BIAS_PULL_UP

	So the sunxi_pull_reg is called and it returns "0x1a8".
	This value too high to be register offset :)

But with my patch:
	pin_base = 352
	pin = 354 - 352 = 2 (PL2)
	param = PIN_CONFIG_BIAS_PULL_UP

	And sunxi_pull_reg returns "0x1c" as expected.
	According to the datasheet [1] (page 349) it's the PL_PULL register.

P.S. sunxi_pconf_get calculates the pin number in the same way (line 490).

---
[1] https://linux-sunxi.org/images/4/4b/Allwinner_H3_Datasheet_V1.2.pdf

Best regards,
Andrei Lalaev
