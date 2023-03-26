Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0113C3A
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 18:18:23 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id y4so27159292edo.2
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Mar 2023 11:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU0s1R57rTB0Vap+wElHhfQVUeZd/w5vcVz6ovrbCNM=;
        b=mI3NkBfiVLCvMSEFH3x+0acKLJDwFQuNyE5e8gceM4ElaqfzXrMHIedboNhmRCFena
         F7La6I4Upg4jK2fzyRRx/oeadq2bBSSz8Y+UX/JTSP/cubhbGrDQBp2iG/WJ5wzGzdCh
         axaJ0K+0GP9v4wHOmMldOf2o4i+qC1D5paKLp24NpJxQ4XmVuqgDANN3FNu50nT4sd6d
         t1wZDY2+0f7KBLSogy17c29Z3iZ39XKWG962URdfxwuW3b+IAgGcEuXAqCVr1nuNSURp
         77ggzX3jSAtraBYFHyryxe+d6o5WQgGEHfYvvCZC1CDrHCEVII8NsZgSfTAy8acj1Up0
         8w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU0s1R57rTB0Vap+wElHhfQVUeZd/w5vcVz6ovrbCNM=;
        b=6/uVM8OADpF0ctP1hd1t9CdeQ1KiS31W0WQHqiOI3k7Zv9e9H79gzSXa1K3GadJzK0
         q03gx7w5/pSk1KBQcQItRaXSu0R677sgJwUATi4CSIVoxq+NAJ+p90rPbBa32nBAbwI/
         1zrSBnJeM8CzXRiQUi0HC3K0QYoRTV5HCi6ZyDefPX3e1hCq2jVWtrt/sYpIfYzGszQU
         JBS/zHnaYOWK0GcIm58CM767mfUnNac2HVvIA0nuuoxtmDP9V7bEq5YL9eb7zmF5bCrU
         8r0PpoPUeiUtIXAt5AbKQL5b3kdXJvdlFy9xdDPvUwQGUiJ7GWDiWPyv3fKd+6sh60cd
         f62Q==
X-Gm-Message-State: AAQBX9fJZgplvsU3ww9SDTKHViAjUtbL7ThXHR9xJRNULQIWynIiwMKB
	DAK+vffhkpkOXyH70ioViXU=
X-Google-Smtp-Source: AKy350bv5fgl4/oHPvMb2JpZdR2ht/Z2OACnckD3D5kBTv0er3Etgz1URQcW8Vww4vzd0h5DPL7cKA==
X-Received: by 2002:a17:906:a117:b0:939:fb22:c4c7 with SMTP id t23-20020a170906a11700b00939fb22c4c7mr10652752ejy.43.1679854702289;
        Sun, 26 Mar 2023 11:18:22 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ch19-20020a170906c2d300b00933d64cd447sm10545909ejb.121.2023.03.26.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:18:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 081/117] media: sun8i_a83t_mipi_csi2: Convert to platform remove
 callback returning void
Date: Sun, 26 Mar 2023 20:18:20 +0200
Message-ID: <1753021.VLH7GnMWUR@kista>
In-Reply-To: <20230326143224.572654-84-u.kleine-koenig@pengutronix.de>
References:
 <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-84-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 26. marec 2023 ob 16:31:48 CEST je Uwe Kleine-K=F6nig napisal(=
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


