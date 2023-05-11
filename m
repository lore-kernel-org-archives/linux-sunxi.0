Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E9629
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 15:41:52 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-965d2749e2eso1273596166b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 08:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683819711; x=1686411711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJn87lJ+zB7x7vYlqcoYdFAqcEQVzkzw8cISkbBs2PM=;
        b=MS/vKOlgjTFJ16STLx9hkywiw4c8JZR12KReEBjR04OeuXt56Qz/AWNR2lORa8Q9le
         qcfVllR1+I75JnPVB9xm/tHB9ajNViScW5q/fgOctvhzm2Cav3rE3i+z7FFT27Gpu33a
         Vt4h/FY+JgCMyAUFN6ElSYX0l2e6vxhmEQYOMCyDoBjaHoKoLDGJ3F2RhbvOkkwXLIxY
         39dztP+3BZqO5SIsP8Fr5WgWi837L8cLmXWRAk6acX+O/aWZ/6t5PzyCoMVy7FmAnjIB
         0EA05FrOTj0+JlM4IreOiWoGf4dAFLhtnQ7bxNkGlKTXX7SYpfi8lazD2/ZgeIVYatHX
         DYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683819711; x=1686411711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJn87lJ+zB7x7vYlqcoYdFAqcEQVzkzw8cISkbBs2PM=;
        b=DO4upW0tjVL/GmrIw80EigiJdLpqZrJsfHwtRiVjvhlZNq7/C2JfIKKFr9IZEZ/JFB
         bvAO8PRU2kMMxFlx3867wVOxIX1UoQwqLjfe3bHlnTOL+IzO5bQ/4Z/nXZEnpS0Ns0yq
         mJDcBTTE1JoswHy87P7jwUv+b0zNx10aC/1azeyPbS9lnCBRsiE5+jEgGYM8NUYSOs7P
         CXo4bT2YIJvdMDJajTAC0oIiLrYnhiWiplU/Ibo4FwPcxtNFx8CSNQfVZzPvouVxK/a9
         /o6LKHU2en6/YfqDE0/UBdUBuwwEFdxW8xKmUp9aosEb1RSn/ZaniEX282pYBQihk9qn
         l89g==
X-Gm-Message-State: AC+VfDwnbi9rTrXo5SY+FTcDWpTV3runMkNhuz/OwsjbwI+YoTYluIgN
	kLCi5LRNQ+iMmyqBrWQpMyA=
X-Google-Smtp-Source: ACHHUZ6JCiu+908nEHSeb+NqEkZ2J9uyEZ9iWqzL4O/f7zJB+PWkptxto5+kHizkAM11S+cRdWVCxQ==
X-Received: by 2002:a17:907:9347:b0:94f:694e:b953 with SMTP id bv7-20020a170907934700b0094f694eb953mr18294466ejc.59.1683819710654;
        Thu, 11 May 2023 08:41:50 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709065dac00b009664cdb3fc5sm4142676ejv.138.2023.05.11.08.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 08:41:50 -0700 (PDT)
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
Subject: Re: [PATCH v2 3/5] ARM: dts: sun5i: chip: Enable bluetooth
Date: Thu, 11 May 2023 17:41:49 +0200
Message-ID: <5832181.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To:
 <49ff7f3cc79838a55a89baae09a4ba12c88573fb.1683719613.git.noodles@earth.li>
References:
 <cover.1681580558.git.noodles@earth.li>
 <cover.1683719613.git.noodles@earth.li>
 <49ff7f3cc79838a55a89baae09a4ba12c88573fb.1683719613.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 14:01:43 CEST je Jonathan McDowell napisal(a):
> The C.H.I.P has an rtl8723bs device with the bluetooth interface hooked
> up on UART3. Support for this didn't exist in mainline when the DTS was
> initially added, but it does now, so enable it.
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


