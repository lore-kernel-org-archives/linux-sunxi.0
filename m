Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F56ABC
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Apr 2023 15:42:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id eh3so142109777edb.11
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Apr 2023 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680709332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3rEjEBIzvTLM76lijFumhUVHcnIxOg2kiFST3j5p5o=;
        b=j0YrqLl8ikrtYvR4+5TGcOG3lc77ztC3YxP5gQBq9siJtXfCwggpjAkRS8aLC9F43d
         rSQfXBM1OZU6sTEseTUVbDj2JJWn1aDs5mYge6bdEXoiCRc/QojFSLK61m2/8oXnJCb+
         5DndmQfMph/b67yqiB8Gkg1xL7KC1E7QGiRdfdHUDugptIJ4RQl1CEfTdGxQGJRMMVqK
         o1e+C/Xv7HkySyEQ8sAu77H2vQwP5ohM8X+SK6xcd9UG+Yc6rbpafDhPmt1hwirNcwth
         kPNsZesw4mHFJDVHDXqCI+o6yg+QmvENnkeFbHVJLwQ/UN4/gp6nsRu07bPJBhhc2/8G
         N4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3rEjEBIzvTLM76lijFumhUVHcnIxOg2kiFST3j5p5o=;
        b=mugG1BXz6a41jYuWzqUUWtqwnyHH6kepcRUFE34tesVniAb/rm1/V1uEaogNEf+Tif
         z8kyPuzjK3/WjI4GJ7grz+nQ5SCxn73/I3zsUI2mTOmXWZoitVMmya9P9LRVw/HVA9i4
         F0DdT9ZDHMlawPioa8iXJsXPtHQJX76OCA0oShRmfWHDOTomnEABFJ3HFh8lRhk6MWF9
         bOWlACR2wI+vU3Oh3Xf27RAd2qWWG1xuW7eUXWuFrT5PVWOFNM7gH9Y/xW6EZludcdZk
         uOHG1Kus2DnDwm+kLOyTvMu4Y0wjOkj+Y6qg13etJzV9dabeUrVLZrzLrozbviUe1d4J
         KcpA==
X-Gm-Message-State: AAQBX9dAfuynBAFbikgZImyXzdq6qo148mWJDl1+MHwP4iD0gS2B9NFf
	4N6pFK2D/fK4V3tD8rGXgL0=
X-Google-Smtp-Source: AKy350aN36e109j2V5e1/9ZUfUjDj2DnafFLoEuOLo0Bk2QvbJEJs80YfcFS2jjLPSNjlEG5VfvZDQ==
X-Received: by 2002:a17:906:278e:b0:932:e43f:7367 with SMTP id j14-20020a170906278e00b00932e43f7367mr3619210ejc.35.1680709331933;
        Wed, 05 Apr 2023 08:42:11 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id jx10-20020a170906ca4a00b009495cfe446esm1174994ejb.223.2023.04.05.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:42:11 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 08/10] usb: musb: sunxi: Convert to platform remove callback
 returning void
Date: Wed, 05 Apr 2023 17:42:10 +0200
Message-ID: <2673762.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230405141009.3400693-9-u.kleine-koenig@pengutronix.de>
References:
 <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
 <20230405141009.3400693-9-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 05. april 2023 ob 16:10:07 CEST je Uwe Kleine-K=F6nig napisal(a):
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


