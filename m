Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F32575
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 16:52:34 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a9so8928266ejf.6
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Jul 2022 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8K5Ogw41nMH5eAaVwuRakPZpwEVH+oq2WUfL0plnyXc=;
        b=dWLlQ1yydSoGV/onW98bsgX35+vMSlNMsket/8Fyvc8SrE6hn740hXzGV95JLJA6tA
         k8yWVE+6rzac12IUsPfv6jg2UnIPG9ImaPqwihUwRrqGoGOccgYaYL7evSXCwGlHbdoc
         ObNLwhypzlNCHvPLRgcgcjphwCMjF65xIr9MmeLnTwnbjHLSTohwXEB585pdbdImVOye
         RUU3W+1ZZJjdT1AtHq3SiI2+Zn/QYSqdbElsYsy5VkT4I9wwvz9eLevZsMJkBDAT7FUC
         4sRjWcyJZQl8y2sNT8aeJx5Ql4FKsU9soxSehP5YrCxca/3ymAlRd3CEddmUEXV/6cU1
         Fs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8K5Ogw41nMH5eAaVwuRakPZpwEVH+oq2WUfL0plnyXc=;
        b=jhWIyxq5j4VLndeiFYN44Tw3wkNNQytLGD8xve9TXwJNNQeJIBfoi4Ttg4Z6RvCeXS
         LnVgFrBnoYG65kjBGpw1//jTtPnW+evLiWQDd5FbDFxIYuoQtTW6CfShnyc4rLIric0m
         L+XzNuHHybBFSOBPC1DM8g+v3kKGxXE7W8UDOiGF1KwA8mrp+R9gT6NMj9PGCJoHgZKi
         MSl/PhWKI7BmRmzQY9bskUzrHf4H3aU+t7lp5/3pj2nE8Ygxax1kG6T3T/jrN84LEibu
         +nhC8E/BwVOJ6rXngOCiJUVLWuDi6XIUDW/9rxXK+u0e2TPW8L+b23lpZQ5mOEnyqeoL
         xWZQ==
X-Gm-Message-State: AJIora/9BHYFovi0R/0aRRIQ1SPGuCWnDSdm5t7XKlxbFOvqSsTYsgfB
	mr0X+24zgHGJHd031S5U/8c=
X-Google-Smtp-Source: AGRyM1teGdrjWgVIBtYPOIVjKMgc0MrMFUoul1cut9eS4Urax2mFKBTuoI3djwJtCIBUSKRFquznxw==
X-Received: by 2002:a17:907:16a2:b0:726:abbc:69bf with SMTP id hc34-20020a17090716a200b00726abbc69bfmr4341349ejc.363.1657299153059;
        Fri, 08 Jul 2022 09:52:33 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id y20-20020a170906559400b00722dcb4629bsm20667163ejp.14.2022.07.08.09.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 09:52:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>, Samuel Holland <samuel@sholland.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH v2 3/3] arm64: dts: allwinner: pinephone: Enable internal HMIC bias
Date: Fri, 08 Jul 2022 18:52:31 +0200
Message-ID: <2758935.Y6S9NjorxK@kista>
In-Reply-To: <13043007.uLZWGnKmhe@jernej-laptop>
References: <20220621035452.60272-1-samuel@sholland.org> <20220621035452.60272-4-samuel@sholland.org> <13043007.uLZWGnKmhe@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 27. junij 2022 ob 22:53:05 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne torek, 21. junij 2022 ob 05:54:52 CEST je Samuel Holland napisal(a):
> > Revisions 1.0 and 1.1 of the PinePhone mainboard do not have an external
> > resistor connecting HBIAS to MIC2P. Enable the internal resistor to
> > provide the necessary headeset microphone bias.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!
=20
Best regards,
 Jernej


