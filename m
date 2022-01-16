Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A552C9D
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Jan 2022 01:05:38 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id x193so18170447oix.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Jan 2022 17:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZu/hPMQAR6JerGfyaKVu4NwDn/+L++TXjPb4qGe5LA=;
        b=xlYARUpK95WH+obZMuApEx27EFq2DTEmuY1EX1dOlNfwSX4ub5aUwaoVdly/t9HR1+
         TSY9EHLXKep2AnA7YMHm2hIRDh7Dzc5Xc5JFAY1mdNkuLxAeJvcRyINKZvbrT3J6opwA
         vqRvFHkDNRN3w48/884LL235NWIvDq9lRSY6P/wnH0SRZANcVph1cQoToqjC4otHs26S
         LibgbBYdz4j9P+2XgQ75maFZb9Fa30lmDZE9ZrYMaJLV7OZfOi7Cgk+BkMptzV4FCIhe
         Nx/rQXDg+rZyRiHxpQb2UPfolwD0oXSFnF20Cas5f5bTNs1aCTeRABxQIucp8KFj4XpY
         GEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZu/hPMQAR6JerGfyaKVu4NwDn/+L++TXjPb4qGe5LA=;
        b=QmANQ0Cyze7ejv5fcDJDbSYhxY6e9DqoABbixa4mrIGdnMuQbVDHkImyOE8ZqwHXN6
         fbcFGv6Dk5vuH+nSq6/GJzUccPmMRn3sutCYzqT6blkoMC9WpIyeUJiijzQjy8xLtKm1
         cd5nszHwVuwfQGHbWiMGdFzivxB4QRjDV7zL3nnoNWAxIIHd8KXhr26/WXsRWk5sz3W6
         k+hPc8d3KTnTsC8Roi79+KZwgAOmjs0t6uE6tbXO+x35oI4JvMSjv+8Qqm8aKTpGg+9i
         NW5uISdpUHIbXgc6mvBSqdO0j1EDkQHg2bT1GOdEipgUWMbdRRH2xQGbnL1S+5cuSj1k
         eepA==
X-Gm-Message-State: AOAM530s3/RgUaxbh5GjeBHfHmKi9WqHrPVdRxgzAnPS1YVVWOuVC5j1
	bfk+rlJOY/yRUxvbJkVcewyxgV8vImH12e2BNVETbg==
X-Google-Smtp-Source: ABdhPJwDK4/ffYyTCt/T0hFCZfC/epnKIPbY3tO20B3nOviEnXENCjxIeq6FW49NrdbhZ59gZWdBbiMdt9mv01MUZro=
X-Received: by 2002:a54:4613:: with SMTP id p19mr12265631oip.162.1642295137712;
 Sat, 15 Jan 2022 17:05:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220105172952.23347-1-andre.przywara@arm.com>
In-Reply-To: <20220105172952.23347-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 02:05:26 +0100
Message-ID: <CACRpkdZ528B4b9XzBpfGAwPbDaDH12LQ8rTce9AsDuKF+v5A=A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Fix H616 I2S3 pin data
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, SASANO Takayoshi <uaa@mx5.nisiq.net>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 5, 2022 at 6:30 PM Andre Przywara <andre.przywara@arm.com> wrote:

> Two bugs have sneaked in the H616 pinctrl data:
> - PH9 uses the mux value of 0x3 twice (one should be 0x5 instead)
> - PH8 and PH9 use the "i2s3" function name twice in each pin
>
> For the double pin name we use the same trick we pulled for i2s0: append
> the pin function to the group name to designate the special function.
>
> Fixes: 25adc29407fb ("pinctrl: sunxi: Add support for the Allwinner H616 pin controller")
> Reported-by: SASANO Takayoshi <uaa@mx5.nisiq.net>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied for fixes.

Yours,
Linus Walleij
