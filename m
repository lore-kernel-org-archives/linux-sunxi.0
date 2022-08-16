Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1861FDA
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 07:50:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x21so12435965edd.3
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 00:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=btmulgmWYDO5JR8p39p3Iuz/rc2ef0rGseMFoYZH5KE=;
        b=UUwbefUxfrJoEJicacb7h0c1OssFJPnj8GXTCZgjd+Zq0Go7zJ86MlpGb7KBPkgU7R
         6ZXIQy0hond0D9rS9sO7mARyG+JVP9P0xKa44ITziLauJoaVdCN7eruY6dKrgl627zzg
         B02pB+PhgIZnZUQOPAVgPgF9y9i7Y/6meHAtKtFMepMPDBmUty9gzP0TRIjWCglw+1g/
         UhBxMFFAub7F6I+4kfr1GkdChw73woRyjrXCHrij9eXKM+yZiGZfI4/rX+SzUl4gFlG9
         vOKDJUE7uc7BXlzCsfObnc/fdJkmYchuFCOtIvUhzXYt1FisJF9GqfCzNhPgAQwD2Etn
         LQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=btmulgmWYDO5JR8p39p3Iuz/rc2ef0rGseMFoYZH5KE=;
        b=1XKzWqp+qBg44KZEw2wLniQ891Vxd7dOBgfLotzMjB3wt9YpRjLZ6oXyh1Y49YmxgV
         Yd5d9RVbgKaQOcnKQcK7GhL7dRd5h0EnbykVfjy8SyjAlcHZmBwZ4twIlEzQB4Q/H+9C
         v5fe3Tk448iOLHwK04U2UXmmpUvk7kXh+ga3qzWWecsJ3Wywnch8R9OLCAJ8IzLuDRDe
         BAcPBvWsfwsPfABxQ1flirRs0LlEMDIKmP+q/Ah7tJ209qtzK0VfUA+0j1NGAu8R+fdJ
         iIQy4vQeG8wt4uoUORJjASZxyN2x7UbktOgnt+bQRPbbX4p6J9hZ2KRlNDALTIZnjV2u
         xaeA==
X-Gm-Message-State: ACgBeo1Q/hRGbcvq0wlmqb++y7TMAm2F4Gl7xGzaIyku7JtQxoHElNTS
	VUzeUL8oYIH0vyeqKsRIt3U=
X-Google-Smtp-Source: AA6agR7BWyk91qEHOc9vxFTS0qUZ56eezGGM4sHl6LeatjVguPj9qJvzTcm3VgsutYCTY31iqEy53w==
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id r4-20020a056402018400b00442fd542a21mr17388865edv.129.1660636200714;
        Tue, 16 Aug 2022 00:50:00 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id fn3-20020a1709069d0300b0072fb3704e49sm4954327ejc.46.2022.08.16.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 00:50:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
Date: Tue, 16 Aug 2022 09:49:58 +0200
Message-ID: <5593349.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org> <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 16. avgust 2022 ob 09:41:45 CEST je Krzysztof Kozlowski napisal(a):
> On 15/08/2022 08:08, Samuel Holland wrote:
> > +
> > +	de: display-engine {
> > +		compatible = "allwinner,sun20i-d1-display-engine";
> > +		allwinner,pipelines = <&mixer0>, <&mixer1>;
> > +		status = "disabled";
> > +	};
> > +
> > +	osc24M: osc24M-clk {
> 
> lowercase
> 
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <24000000>;
> 
> This is a property of the board, not SoC.

SoC needs 24 MHz oscillator for correct operation, so each and every board has 
it. Having it here simplifies board DT files.

Best regards,
Jernej

> 
> > +		clock-output-names = "osc24M";
> > +		#clock-cells = <0>;
> > +	};
> > +
> 
> Best regards,
> Krzysztof




