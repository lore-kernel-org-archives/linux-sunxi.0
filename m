Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541F65B
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 04:53:45 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y8so19789519eda.3
        for <linux-sunxi@lists.linux.dev>; Thu, 07 Jul 2022 21:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ifd6YvR971sQbkTDoi8ioWcjmTS4ihpj6psKjLvOgsg=;
        b=lfYE5tzh2TowBWRFhQcIuCLeYjkDlkpzZ2FtOaAaopdYJWsvkxVeyl+Q6TGRYOuyml
         7stejPBh/SbFwt6MxCf1WtdOuMCBlry6XBrfGPqpP9vka5bgU/GzUnL33CTZUENla7zp
         vNexaOxkdZG1rSJvrvigLC5E6ositJqzUo1EcdYnp5rR1D3i+N7eRDEAJhK4scna2wAZ
         l+LMeEnGMM7YGMFyN1QDqM4AqI91F54CDZQJtf0gboXW/GdSihXAL7RkjlpCl3YyzBB8
         ybJafvwIu9btRqoJkCQCtHgBVDwQDSA8ZOcCUF4wgsZnvoqINPUSWVJc+xsY0jUi3yMH
         UQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ifd6YvR971sQbkTDoi8ioWcjmTS4ihpj6psKjLvOgsg=;
        b=knZq51OSIrtiV4lXH6V0o+D4keuBAYlyi3mnntzeSGrWvNfkOOl8AvJ+9uYf+0yLJn
         JDDyNF+IuvgQvdPJtYVwM8Kn1Ck5YiiMBsznbZ0Q4NEMqHzRA4qazZLZ4QQJxcsXpclX
         qYhQNSd0IEjKgI7bxe2I9efl9Rogii4hwuwuyy0ksEYddyWvd9eJHy27T4jPnD5tGq54
         U9zvCDSXkWMpXjKRxYaLSzDB9c6eaY5iNghcD3VEDh3R5Uf+wkETVGuGDxbDHftZkGel
         LVK43yHKU5P8kvI+jZ6dQ1seyirQlRmqsF0SSs5nFe+YJs4L2oLc7nV54IJvdTj9x9v9
         V+XQ==
X-Gm-Message-State: AJIora+dDVcg87LR3bj/2+8rwA1VFDNcrYUdJM3YVrHdCAf4PdqaXNeb
	GcPWOqIQM8+4YkUihoQCct6H/w/qe0zAYA==
X-Google-Smtp-Source: AGRyM1sdjA51qCoZ7NUFs/lENCEIWfFIXxbWT341U/bvcvuvoTdMakI0TtWwRJh+P8OquJViwHo9hA==
X-Received: by 2002:a05:6402:328f:b0:43a:8488:1000 with SMTP id f15-20020a056402328f00b0043a84881000mr2198862eda.105.1657256023794;
        Thu, 07 Jul 2022 21:53:43 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b00722e52d043dsm19778844ejf.114.2022.07.07.21.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 21:53:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Michal Suchanek <msuchanek@suse.de>
Cc: Michal Suchanek <msuchanek@suse.de>, Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sunxi: dts: Fix SPI NOR campatible on Orange Pi Zero
Date: Fri, 08 Jul 2022 06:53:41 +0200
Message-ID: <5580737.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20220707170721.20225-1-msuchanek@suse.de>
References: <20220707174801.36e010da@donnerap.cambridge.arm.com> <20220707170721.20225-1-msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Dne =C4=8Detrtek, 07. julij 2022 ob 19:07:20 CEST je Michal Suchanek napisa=
l(a):
> Without "jedec,spi-nor" compatible the flash memory cannot be probed by
> u-boot. The macronix part is what is shipped on the boards that come
> with a flash chip.
>=20
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Next time, please add changelog below --- line.

Best regards,
Jernej


