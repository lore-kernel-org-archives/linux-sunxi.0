Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBCC3C3A
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 18:19:05 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id w9so27143134edc.3
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYDVTthcR6u9E+XHEe13iqcOf0r5Jx1Dzo1NUFq9hPc=;
        b=XcozPoJra2LYibW9h6/atXgn9pefgpJIQSPBygEPLaP+8JUHtOS0iLfSH7ya8xurIk
         qD0UMLTik77Bsiea6PzOeMEuQhBqxV5JyZgiRxCVLl5fa/tJmrOvyEaGbk61e/HBoESD
         B5nC7b0YcsjJ2LPFL7Q0vGbxBhyyphVD8Suu+wukWjexq1oIm6XZ8tSgaxlLRQvj+wQk
         QI+afcWU3rjs6/XMuFPobZtd9dNttJ18fl+Z3/WoDiNrGjuK+UGy76qLBEmsqTBigtNJ
         S30S0Em8vcsRDTjT4Dtt8YJp6nBpcZcfrssbF0X2VSRvab95iCHg1efQxI2hJQt5x23o
         vODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYDVTthcR6u9E+XHEe13iqcOf0r5Jx1Dzo1NUFq9hPc=;
        b=A1mO9VY/zsBpRWG4cCI+luDUZ9Q+dTnxk4KPaeYMwbt43Sa384HaO0TGQmve7FT49x
         TMvnPgbyklDBGbbt6Z1igWz4RWze0i08XDWYWXbksIzMePAPjYxYKV4v6/3TWhLvzRvp
         fuhgS1HBEo6lHSayV93l1+fuYgPCGXVMUIRqu/llEQd+TuCRavMZbDvJaMS56lkYz7km
         WzkcnSIf/yjq2o11QdaC4OFXpfPgOXFKtLjqu9zslmiLeyGPcGq9FTPp8ePC18Bm7lDc
         QCvMqW4gqW4J+0LFhas+hpPvXo5LWitHjF7jwrJ8Rn5ebd7sBX38ncFGAz1XesVonR9L
         jrGQ==
X-Gm-Message-State: AAQBX9caZcUpbPy8fXSrbpd5n2QeEQL01Ux68a3zSdAyE7uX3A3gSrd0
	7oMm7OECaawyMaHa60vgaZ0=
X-Google-Smtp-Source: AKy350YETZ4/536hGpirOgHRYIttr1kCkxkvIFfLXdI/sCdAj1cP+ScdLDU+YzfmPXsFogGZuC7sJQ==
X-Received: by 2002:a17:906:8288:b0:933:44ef:851e with SMTP id h8-20020a170906828800b0093344ef851emr10449837ejx.55.1679854743840;
        Sun, 26 Mar 2023 11:19:03 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i13-20020a170906114d00b008e0bb004976sm13196105eja.134.2023.03.26.11.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:19:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 078/117] media: sun4i_csi: Convert to platform remove callback
 returning void
Date: Sun, 26 Mar 2023 20:19:02 +0200
Message-ID: <1849373.CQOukoFCf9@kista>
In-Reply-To: <20230326143224.572654-81-u.kleine-koenig@pengutronix.de>
References:
 <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-81-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 26. marec 2023 ob 16:31:45 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


