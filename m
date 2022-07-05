Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AFA6010
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 21:04:58 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id n4so4464859ejz.10
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xsDCVa++41WRsgJcRaNP0nRk9zNglrTjlOIi6M6lplg=;
        b=XOF5A6dCni+ZyA8p8TlPz8MUPc21YfwPx7xJuMY/HpC52rpPnKWv5EfVyK67gYyt+u
         yNJPH8CxYcbiC4noI3S8MiQ6J77MlPanIhNHzSDssQDSHUWPdu+BgHPN8n6WRLDU4etu
         Y0djmPEhHSkr5zYGVcodvWy5zoGuM6AA2wKgQxZRJj+rqR3UK7DlXL6X1yXmlCiyCrJE
         AfPwBpZabBtwvofL+TBbsJxH2hsraxFAJqZwoNQOz32bInt8xNhNKHKcJW0cv2eCgwbH
         NLV0fGDkmslmL1e7sb6+U06pcPEjuL6fKlApKB7IWn+1qYj61feMosZ4nkDuswc8m4j/
         0pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xsDCVa++41WRsgJcRaNP0nRk9zNglrTjlOIi6M6lplg=;
        b=UatNNTTGe0HlB+fuZrA5iY/AGqLxeaBUErjZvwaIfyWlOxFyxYsUICwT6JoZ/KnbTo
         M+5bxbKr6WiqZkbWiYmbXEneERxiXnMUQqb2zjNCJF109RYoBp1LNT3NbC1N9/YzsdWo
         jiZzSKLtemHOkvoKcluhezL4oj5xOhX+dudtZ2G94qjr3jQflmr/pHHzU+AwAhixYeyL
         BpEH53Ermc/SfzkrMWhJYuaeJ+EsJWTR4cEmNSkr0Ug7qhD5uel46sOSZR9w0kDLChd7
         5VBjRxTj4xRhYgcwa5smpUI/XKUIgVdKtsPntJ/eNOiMBYMYdb4CuWJYRCJznMpOJ5gH
         cTEw==
X-Gm-Message-State: AJIora99MZdPd1EQINKkJQ5Irh7mlj8MBWwywhEVwKz0jc/DDVOtkcI4
	jS6DvGTAX6ExIQ9wxW52X3k=
X-Google-Smtp-Source: AGRyM1vRC15LiW8FGGShUPVfcpOv23sewSq/KWTbXpNcQHbmwubioDrDq1AhZ5YHPF561xVHmSUzpQ==
X-Received: by 2002:a17:906:d54e:b0:726:3709:605a with SMTP id cr14-20020a170906d54e00b007263709605amr34558192ejc.424.1657055096474;
        Tue, 05 Jul 2022 14:04:56 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id d8-20020a056402000800b0043a71c376a2sm3617210edu.33.2022.07.05.14.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:04:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, samuel@sholland.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, perex@perex.cz, arnaud.ferraris@collabora.com, devicetree@vger.kernel.org, tiwai@suse.com, linux-sunxi@lists.linux.dev, mripard@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH v2 0/3] ASoC: sun50i-codec-analog: Internal bias support
Date: Tue, 05 Jul 2022 23:04:54 +0200
Message-ID: <1819721.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <YsSl+JOmMpGLK1Xc@sirena.org.uk>
References: <20220621035452.60272-1-samuel@sholland.org> <3139722.aV6nBDHxoP@kista> <YsSl+JOmMpGLK1Xc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 05. julij 2022 ob 22:58:32 CEST je Mark Brown napisal(a):
> On Tue, Jul 05, 2022 at 10:12:56PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 27. junij 2022 ob 22:46:30 CEST je Mark Brown napisal(a=
):
> > > On Mon, 20 Jun 2022 22:54:49 -0500, Samuel Holland wrote:
> > >=20
> > > [1/3] ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
> > >=20
> > >       commit: 24e0b04dd42be34ec4b18dc1a1e139d66eb572a3
> > >=20
> > > [2/3] ASoC: sun50i-codec-analog: Add support for internal bias
> > >=20
> > >       commit: 25ae1a04da0d32c22db0b018e5668129b91fa104
> >=20
> > Can you also take patch 3? You picked bindings change, so it's easiest =
if
> > DT change goes through your tree too.
>=20
> I can if the sunxi maintainers like, but normally changes to the DTs go
> via the platform tree.

I am sunxi maintainer. Wouldn't my branch generate warnings, if I have only=
 DT=20
changes but not bindings?

Best regards,
Jernej


