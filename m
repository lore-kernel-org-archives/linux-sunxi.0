Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF111C85
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Jul 2023 09:29:56 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-992af8b3b1bso436218066b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jul 2023 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690018194; x=1690622994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjVqeX0y//4nrDSpiCRGlr32t9U96I9NgVlq9whIyS4=;
        b=c/lWRogWO7Qdah02C1MkCGhNJvgGrif4oTCaPGdiK7W6NLpgxId3WwbMLqpuO472V/
         hv+v+JpG78Ij/VjrLudZjSb9znRBygfAX13gn7AW9ZXgckupA3UpSu77hFE43mLYi2Fa
         dTmzQqzoJTB+XVZxAcFcRNvrKHq8cPn3QNxRcXjlHczYx/PagKU2z79FFJsETjma5XPk
         WNjKvgSkT7hDponNZI1p983MhnTS1Cst5EKzwhQIk1ixI2QEL4OsiIASZnodOuY3q33i
         DzXo6i6W7Gban+p5Kj2vaFzbtu1B80PDCgmkgfzP8TzJaF9uqIgupXTYoalJZ8ajHxDt
         bdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690018194; x=1690622994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjVqeX0y//4nrDSpiCRGlr32t9U96I9NgVlq9whIyS4=;
        b=XdXk8ofFqC3Cwu3pFqMdgYsseQYeQ/p0fAjtmkgsgCmCz1iaiBINVFBOay5QlgJY06
         MDmSEVqrOg/Oe47zcIUmtPQGLY6/+tqosSj3MhoKBtEtfcyLml4XQiAuVh+f0/035/s9
         QEhg62QuNQNs8WdEI+b0E84vtsE85en+GE8rO6Q3eENLmbJV/brR5sQaa32gNdPuyKMT
         dN4ZS8Ob9jU2SN1+h1/jQ18T5OujWK6O4+THX2/eQ/6kfHWSXESQ3k3FPwfdNpn1YS6p
         Ka46rtHYeiBnORBQ6LY1PxWzLTgQwoP/qdyAFiZeVtPDgyarpRS2w2/8J7yYnhCIZ7Us
         WlHw==
X-Gm-Message-State: ABy/qLaRAB3QtonZWSyf2zPW+z4jJEq9ovr0lHDzD/+uG568iz/lHWco
	DBbOSe0N9x7uhpLmwLkJhFgj+Q==
X-Google-Smtp-Source: APBJJlE7HknlGAjPgKT8dkx6J4YpoyIOaTkrnSeiX1f1kudR9TNvxMzo3HNczgig+NEQVx/A2dTm0Q==
X-Received: by 2002:a17:907:778c:b0:997:d975:64eb with SMTP id ky12-20020a170907778c00b00997d97564ebmr3847932ejc.35.1690018194587;
        Sat, 22 Jul 2023 02:29:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lg26-20020a170906f89a00b00992b50fbbe9sm3307981ejb.90.2023.07.22.02.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 02:29:54 -0700 (PDT)
Message-ID: <9fc41843-3dd6-7b22-edd7-1a22b937f646@linaro.org>
Date: Sat, 22 Jul 2023 11:29:52 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/4] dt-bindings: net: can: Add support for Allwinner
 D1 CAN controller
Content-Language: en-US
To: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev
Cc: Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230721221552.1973203-2-contact@jookia.org>
 <20230721221552.1973203-3-contact@jookia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721221552.1973203-3-contact@jookia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2023 00:15, John Watts wrote:
> The Allwinner D1 has two CAN controllers, both a variant of the R40
> controller. Unfortunately the registers for the D1 controllers are
> moved around enough to be incompatible and require a new compatible.
> 
> Introduce the "allwinner,sun20i-d1-can" compatible to support this.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

