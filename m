Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42947A
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 18:31:25 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id e15so6892412edj.2
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Jul 2022 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=36rF+EA9uWT2mpDidJKHhWxhm7lBZsbuip/44O/He84=;
        b=nZeY9K8WaHz5JD5ODEhu/zIQe4g+MprhpHQMx5NXH6omtiCN8zigVz2fSVcqhdDJms
         nQ8k0otOaI9HEXXEIHmPujzhLPR5no60CqGH9jtoAxvOpQSnVzScGrlbRyhnNg/QQ+sr
         rnsZVmKxskDfo5XiFG+4P8vx1ZA0TARB4gMbsgD3F54TfTloOm4n9Vy3bfK7vmyQRhxZ
         UaJmrF/KirG1hicB8K8ZlgFTuhiklPgwvOrkUMphy4Cddfromg0RM2y8n0LBoaBIs8SV
         eJEuOwiNY5YqWCT2WYJbLHs80b6BUWRd8giO+5gVJXfClKML1CmHoKzwzfvR35hEY9ub
         bzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=36rF+EA9uWT2mpDidJKHhWxhm7lBZsbuip/44O/He84=;
        b=2ViCthW68ltk+7xcsDUUKghBealYIjdOIW+l0EIJP3Un7b7En3cPoP2z8cNHZZv+q0
         PrhkCsTDZTslDcUxuG3L43T8EL0lzaUkeYvSmI1kaWIbpO7+5B8PZD8ikvzTXowBQG4Z
         Xpb69fGdKC74P6lJTloYcIaA4xfX51Y9TcD/kyo8HL4coU/gJUmJT9JJMVnZ9NpHE3mS
         kYpXqu4+kS5AoGofNiVzqPQEGJjJ94+xNrAfTeFhDv2EJz6vweNuJlzJ8vwy4qL1HXIY
         o+glN5JZcIz+7aa8WqUACq2qBhHU9Y2y59qqQgXGeTACyXYh4OJBrJu7FChqLYZMLunX
         dZ+g==
X-Gm-Message-State: AJIora/IDiHtKygQuGDbDsSB0U4+iTK0ONp98Hu2zZE1dEYb8f676woE
	WJzsR2KzWwueMLTzMHgjIvw7GuDorXQ6ww==
X-Google-Smtp-Source: AGRyM1uMFV4eY7pt9h2ChiX00tWhYrTNc4IF6JZgK/pJE3XvGVynvEOrkEPJp+VKO1Wes1398mV+Gg==
X-Received: by 2002:a05:6402:500b:b0:431:78d0:bf9d with SMTP id p11-20020a056402500b00b0043178d0bf9dmr6553702eda.184.1657305084077;
        Fri, 08 Jul 2022 11:31:24 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id w3-20020a1709067c8300b00722fc0779e3sm20628128ejo.85.2022.07.08.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:31:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Michal Suchanek <msuchanek@suse.de>
Cc: Michal Suchanek <msuchanek@suse.de>, Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero
Date: Fri, 08 Jul 2022 20:31:22 +0200
Message-ID: <2128843.C4sosBPzcN@kista>
In-Reply-To: <20220708174529.3360-1-msuchanek@suse.de>
References: <10106175.nUPlyArG6x@jernej-laptop> <20220708174529.3360-1-msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 08. julij 2022 ob 19:45:29 CEST je Michal Suchanek napisal(a):
> The device tree should include generic "jedec,spi-nor" compatible, and a
> manufacturer-specific one.
> The macronix part is what is shipped on the boards that come with a
> flash chip.
> 
> Fixes: 45857ae95478 ("ARM: dts: orange-pi-zero: add node for SPI NOR")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


