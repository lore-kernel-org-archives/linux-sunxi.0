Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29227442D
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Apr 2023 14:41:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y14so26849038wrq.4
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Apr 2023 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680446502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEt4l1scuvVJz61CdEo1J/wJGcCf7qx7gZaNe6q49Tk=;
        b=AM6IaoRgryD3mDHhYKjzWlGbOI4PjjiEREetuHxrbI8nRCASKBbID1ipXfMppUGefn
         SbRKbLaAy9LbJ3V3mYVh1d7MfKEOcTMaYCQgoi2kIqrA8WieblRhcgfY1lBJy2l7AUzC
         EplF4yW5IeKj4Msbo4Qhegh3MyPtngcY4GgSehJsaeWXcZlkh0ImoFsC1vlwoaBqzZMx
         4vAu5vD81iViSQ0u+6NM9bNpQVITK0e1iinU0lKKuoX3lh/VtVQ8biplLPpVXwfrl8cH
         H+K6jZscXL1FWh8GR95ZawTqsOkOrQbpoOAEwWn6qEyY+R1pr8ctvfOnNibyvJMAgT7h
         KTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680446502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEt4l1scuvVJz61CdEo1J/wJGcCf7qx7gZaNe6q49Tk=;
        b=ZIvw2ekZ1ekZnwMw/zREp5jsK4v5S7tOYxS0B7xqoQ6NKCH+yNlHVW3phPN6nZie2w
         CJUwIe/hFCyk/4UpcfE5Dkmt6PvKJcpgHthc5y6/Aa/TZzuXT0TUpCK/L+Tgiqoqd8KI
         hb+0DEFATN1ETECO8yrE3BEKz5KZiIc6EsTASRLp4qEuABUbDcAaCn+CXtRlHom9EqfO
         tTdib0chN6sBfBCEQ16P+egKNvgJclAcJVZC6SHv8Vu9UIMdlf97gsFed5OPodieTcJd
         BD46pBMsYtgf998sCyBHbn7HLS/dj07dFaevTy/SARuwK0nSybubgrjBOOiSnd1ElX/x
         I9Eg==
X-Gm-Message-State: AAQBX9eE1vcnDZNGKLK34gBfMZxZv1aahf8z44M54jj9bKEQkH3QZK0D
	VN3cOGhzBJgcrSIyV/BeI8I=
X-Google-Smtp-Source: AKy350Yn72Cp3g4kqSIGRXETjmEUB7dsTtjqD1MDsR7d5+bikqDEJ859bvNTN8XhIC4ugyFr+biBQQ==
X-Received: by 2002:a5d:58e7:0:b0:2ce:aed6:3f2e with SMTP id f7-20020a5d58e7000000b002ceaed63f2emr23235081wrd.46.1680446502253;
        Sun, 02 Apr 2023 07:41:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([209.198.137.155])
        by smtp.gmail.com with ESMTPSA id z6-20020a5d4d06000000b002e6d4ac31a3sm5053895wrt.72.2023.04.02.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 07:41:41 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject:
 Re: [PATCH net-next 10/11] net: stmmac: dwmac-sun8i: Convert to platform
 remove callback returning void
Date: Sun, 02 Apr 2023 16:41:40 +0200
Message-ID: <5660915.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
References:
 <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 02. april 2023 ob 16:30:24 CEST je Uwe Kleine-K=F6nig napisal(=
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

=46or sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


