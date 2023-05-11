Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC06629
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 15:41:16 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-965f7bdab6bso1439160166b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683819674; x=1686411674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQvmwXze/gAqnIrgLBTRF6o+N3iet63b3mZHiWkHo1M=;
        b=R+mM0kDvSAW9/bcQxchnx8KMaoBJkzUgdxFshMn3eziIIGnQj4hUwIRJ5QJmvD9PsE
         rsvJ2qdw8grzDjiCNhyrsVxtqUBqUTeZfhyym/KI0oS7K8nQom6jjwU6t6a9t/SUJCgs
         drI/3UKkfV0Fjr+sSUjQcyYEI5nfjxrevWeodqgra9gNfYy1uh2+yAxyjqd7sx50PztG
         IKPMaC4MBwS30zHmOgHPdIORETB72ERmSnrFnfEhM2EoiZSXdFrIBfsfWbc+xMfpcMxX
         2EYTLQWrBSQvOqP2fz6Jz0dNEoNu6gBilktSfirZ7kD6Th+alKOwND418ifu2LjrVQRb
         maXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683819674; x=1686411674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQvmwXze/gAqnIrgLBTRF6o+N3iet63b3mZHiWkHo1M=;
        b=Gi7AgGr6mIUGmtkceL53th3ow6ep5/smUfXfawR9l4Bj4arCi4BERze4WNWc6dTKhM
         PZscdrP4UNdbeOdXGEYxTcPB8xZuehkwSY2WRyCk0vS4l3rX0lEbq5GV42Al2lpEBnWi
         y397GRfiyjNOz/2obTbVc+Mw81ZgIQjBE8G9s/6Be7Ne1SpSglbFyDvRkb2VDmXnUzWC
         /VmAecoF+x2nOmsHLlK82AHO/1BASNuo/hrtwveVmlvxAA5giGIhM9hvXoRL2V5fCZtU
         O7VeHZnAfhkCeaZNLBclJSxKAknNNNV+VwKGBBvp12kxywoOxq08fkqSIMzI4RUeAgd0
         Fsjg==
X-Gm-Message-State: AC+VfDxaaH6vhz0gP0WZFSkjSBPk2TBO6xphXBjkF9icuEBDqbK9SEfg
	O8RiwbaiRHiiTYyd8ZSXj/s=
X-Google-Smtp-Source: ACHHUZ41ANw5B2GkPpvpGC9WwEa6jWcyO6TJtFU3f5cKq/IkQ3D9s43WRsjgI6WPzHoEL79KPbR8IA==
X-Received: by 2002:a17:907:2d09:b0:966:4d75:4a44 with SMTP id gs9-20020a1709072d0900b009664d754a44mr15271821ejc.24.1683819674270;
        Thu, 11 May 2023 08:41:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p1-20020a170906838100b009662b4230cesm4257581ejx.148.2023.05.11.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 08:41:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan McDowell <noodles@earth.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v2 1/5] dt-bindings: gpio: Add GPIO3 for AXP209 GPIO binding
 schema
Date: Thu, 11 May 2023 17:41:11 +0200
Message-ID: <9107543.CDJkKcVGEf@jernej-laptop>
In-Reply-To:
 <e22cd891ea966bc18411d01d5e3b0d94e7ba6869.1683719613.git.noodles@earth.li>
References:
 <cover.1681580558.git.noodles@earth.li>
 <cover.1683719613.git.noodles@earth.li>
 <e22cd891ea966bc18411d01d5e3b0d94e7ba6869.1683719613.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 14:01:12 CEST je Jonathan McDowell napisal(a):
> The AXP209 has a 4th GPIO, so add it in preparation for support in the
> driver.
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


