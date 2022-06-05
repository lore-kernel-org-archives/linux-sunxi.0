Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8D71FD4
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jun 2022 21:26:00 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id az35so2541820qkb.3
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jun 2022 14:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/UK9ijdy96x8DCtDL8y2FIG0/CEGyl91Wy+VkB6R2So=;
        b=4whpRqf12iMyfPIEaTo3OshvHlbz17K/0TaYuWpr5kdfZBIWNRAm3RtGhYqJ2OZZzK
         9dDvqmYVf5sQlGFg1AnRva+443GyK8XdQP38ZsdL2rkjEuJonmJu7FArXzj3a+y7OSCC
         ERdxI1/KIAT4eb/NTUMeH72L52SA58MBnyHXTM2/Q1eGbORKSRUFp4emijQP3aymCxcw
         a0esPRsrypvsybpQwJWeSkLnBq2GkJTaDY4fVcxWQeV8Czt9MBnYMam+JUW/hIICqtam
         qay1MHQykkZ42dahpen2TCN+p9onKygrGu1PM66Ot9uo+FFTlaCAb6Ut3DiecxjkjFX4
         +EXw==
X-Gm-Message-State: AOAM532dsr06CyqWhqDpQxeVohUsa3EyVatOCQ6SX1bQpZkqt8fDRr0e
	0Trx2CKGa53Fr3XhSCjPqg==
X-Google-Smtp-Source: ABdhPJyEop9w4xBaCYIjf/DVQB28Y/OqN0tkJGt+4cQZQiepHy5gy4KhZBhLpI9CNR+b7AQev6vAyg==
X-Received: by 2002:a37:e202:0:b0:6a6:ab87:113d with SMTP id g2-20020a37e202000000b006a6ab87113dmr6241549qki.605.1654464359603;
        Sun, 05 Jun 2022 14:25:59 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id d19-20020a05620a241300b006a6c230f5e0sm388127qkn.31.2022.06.05.14.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:25:59 -0700 (PDT)
Received: (nullmailer pid 3545686 invoked by uid 1000);
	Sun, 05 Jun 2022 21:25:56 -0000
Date: Sun, 5 Jun 2022 16:25:56 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/3] dt-bindings: pinctrl: sunxi: Disallow the resets
 property
Message-ID: <20220605212556.GA3545625-robh@kernel.org>
References: <20220531053623.43851-1-samuel@sholland.org>
 <20220531053623.43851-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531053623.43851-4-samuel@sholland.org>

On Tue, 31 May 2022 00:36:23 -0500, Samuel Holland wrote:
> None of the sunxi pin controllers have a module reset line. This is
> confirmed by documentation (A80) as well as experimentation (A33).
> 
> Since the property is not applicable to any variant of the hardware,
> let's remove it from the binding.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml          | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
