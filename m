Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED327C
	for <linux-sunxi@lists.linux.dev>; Mon, 29 May 2023 09:51:58 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-568900c331aso7971897b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 May 2023 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685353917; x=1687945917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su/Rx3R9SIBQIy8nzLVz8h4unOUxvvoq51HIXg2HVxw=;
        b=SvgGalIWd4YpI8eO1XbYqYkkltOBsRIAg7aVjdN8kHIzFpwL4etKpQt2zwiS/Na++Y
         x40/GZ6rKzPbINfTSD746IbsAr8IcQjWFM71bPZxb51lpVQDLlCJIc5DOuKAFkJ357gW
         EB+RadmpKVbRMCOZI1FiOzWcOpI/YMdo1IogGxCIuUqkGqlmAHJlTN7JrFB7EOejkM0Z
         TYsH+y4DCN/62wUXm+gJwGVL0sefHaXOvpx5ddoGyR7k+q60FMHU8cGFoudslg1u8BR1
         vxElZPligfVKNmVHKtzpRR68WYzmcD+ApeT9Lhq9m+8b5p8SPj0zFE7EYREk6IG4Y7+1
         rqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685353917; x=1687945917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su/Rx3R9SIBQIy8nzLVz8h4unOUxvvoq51HIXg2HVxw=;
        b=lCf0xWV5Su344t42F7dSeS2dUZEARhTte3ZiBi/D974DVssNeyO5rHZYyqkS9RXVxq
         Y9lft5n+ZOeepTvYvlQ3ofU3qWXx2wEyvHE8OHTdTLpyBOCk7pB2k+vhrLEAC6hlpbBS
         4x5KYp0wKYgcPV/MjT+qxQReDRvyPQ6JpO8G0xMBALJE+rAdzMQ/0dNPMTCvagtNFumL
         aoBLIkf++jISiUbfM2rDPM8rDXHDpA2O+wVh7KVV71DqOMya4NlWEf6DSEcnB0nBtomV
         Ck9tr0HtiMsm8tmnxZQXauJWMA+VRpS1T+ZbfeQ96C+8JpqEQeK5vCKnFRSb+/+1/2P4
         V9RQ==
X-Gm-Message-State: AC+VfDy0NMBJOQKPkYjo7RjEJSL0voGPylw/PS0rradex6YvgScModPb
	WjVkJTpxLGgGsq0iyX5oehcnreaUoi/8GCtweMQwzw==
X-Google-Smtp-Source: ACHHUZ7ThBBzG5Zs+36ad76vI5Em4SgJRU6DaA7EJm+LaJAP+r6+CaqDcEkYZqMbcGvrTiWS9Gf9/EIH51/1Z/ln1w8=
X-Received: by 2002:a81:4a44:0:b0:559:e8c2:6a1a with SMTP id
 x65-20020a814a44000000b00559e8c26a1amr11677406ywa.18.1685353917052; Mon, 29
 May 2023 02:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1681580558.git.noodles@earth.li> <cover.1683719613.git.noodles@earth.li>
 <f9b643ff0d0ed770f5a841111f213f8481dc920f.1683719613.git.noodles@earth.li>
In-Reply-To: <f9b643ff0d0ed770f5a841111f213f8481dc920f.1683719613.git.noodles@earth.li>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 May 2023 11:51:46 +0200
Message-ID: <CACRpkdb-wp2631KphG+iwnVaYk0Sm9JCLpoz1DuSQd4jXvEdAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: axp209: Add support for GPIO3 on the AXP209
To: Jonathan McDowell <noodles@earth.li>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 2:01=E2=80=AFPM Jonathan McDowell <noodles@earth.li=
> wrote:

> The AXP209 device has a 4th GPIO which has a slightly different register
> setup, where the control + status bits are held in a single register
> rather than sharing AXP20X_GPIO20_SS with GPIOs 0-2.
>
> Signed-off-by: Jonathan McDowell <noodles@earth.li>

This patch 2/5 applied to the pinctrl tree.

I just assume it is fine to apply this one patch, Bartosz already
applied the binding patch.

Tell me if this works.

Yours,
Linus Walleij
