Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F9C2575
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 16:50:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id l23so6845440ejr.5
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Jul 2022 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0VmPLkwd+jsfHM5+mRGOUxbGgxotW4G1hW6i/2hpi/U=;
        b=j2lCJer7VQaif4Gj9+tDaqXNkwLb6+hi7pvOFMC5CUPaYGfI7QOihTIbv+xa4yYiet
         Qx+WhsfxNnu4J9IpMo9qzMHwgRt8Z+C10ccQpyCP3dhAKw+LTofuaAP5iA2L3u8iToDe
         ObOrYGT8wE0vN3Dz/QmQNh2zBPUqdfVmQizSjqP2ei6GDkHL92B0hNMmhJPyBWrp9pFH
         IrBrQa8zJ1OYSnLeqTZNw6D8AFNoUCwp0z8vOWQOdw1eh9QTQdhYHGM09XMtiwDBMQaA
         iWvqbkAupyFErhqV665byWsjB8TOIpOvhi5CQkZpBMDz5BEucLauXHoPWiRbLeJyBBxV
         dMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0VmPLkwd+jsfHM5+mRGOUxbGgxotW4G1hW6i/2hpi/U=;
        b=C3rZOjeflXLcOkceUhYDQY1tSUt7rKFIxcGFFuUQiXgEtRj2FVtVx7miEneQz9M+Sl
         Dx1zrBcFcqb0/ik4t2wUVmW9uW0QvtfPqqsFLSx7dEB+9y6ISyCNmhXQe1rrqJlCopgY
         nGVoTlcjQqCCd6D83qyXeXK+vUN/qxXEpj5wEwuQwf2iT6JRXeY2EqmxeibFmxa0Lij5
         DI8ELACGjq553TqA8PWx9GuEX7L54YsyBwKOKgg55MyfETLypFmUa9JJxDs4QFI+gnNl
         B0Vg4E3sAUf7i2jntLl1Ke/soPW+QCtebMk+YxGOkCUfLGzScNSIGG2rjYb+3+4cSZVw
         plAg==
X-Gm-Message-State: AJIora+Ex+UoTOZzwwVSHtgxv/rVQWD7jY5npiEqafA5iEhV1SGpn5zZ
	EnpHerpP0oLKhs9Jn0UAHcA=
X-Google-Smtp-Source: AGRyM1u8pUAPgSJnIA4mi9w1D8Y2TiHSvOt67lcDD4EJjpozOfSw3fl72TuSp8do6cqLJme64f41uQ==
X-Received: by 2002:a17:906:c048:b0:718:ca61:e7b9 with SMTP id bm8-20020a170906c04800b00718ca61e7b9mr4473154ejb.120.1657299007703;
        Fri, 08 Jul 2022 09:50:07 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id g4-20020a17090669c400b006fe9f9d0938sm20819211ejs.175.2022.07.08.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 09:50:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Default to the full MBUS binding
Date: Fri, 08 Jul 2022 18:50:06 +0200
Message-ID: <7534543.lvqk35OSZv@kista>
In-Reply-To: <20220702042447.26734-1-samuel@sholland.org>
References: <20220702042447.26734-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 06:24:46 CEST je Samuel Holland napisal(a):
> Some older SoCs use a deprecated MBUS binding with some clocks missing.
> Currently, new SoCs must opt in to the complete binding. This should be
> the default, so new SoCs do not accidentally use the deprecated version.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied both, thanks!

Best regards,
Jernej


