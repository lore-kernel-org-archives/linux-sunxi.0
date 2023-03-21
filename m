Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F12C9440
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 20:31:42 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Ph3D35wsCz9sJB;
	Tue, 21 Mar 2023 21:31:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1679430691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EI5/y4CkeUNPmFzU1WxwnwF9KrIdum2QGMnmVmYyGcA=;
	b=ZWa4V3Z8E37AtZWzuoa765w3O+EbcbsjORlzxFQ303NssHQP/4F4nxS3Bf5Iy3GkO3FfQs
	mO4NdgckVtiK8J7lsQLun16oIBolSsFXsD/FvIe0DLOCnEdoLQXdSFGGc1WN2DPTJT8r2M
	UmRjE2Mgj16nMpWrErfWfy7Q2vU2iU1waTn2c5oERGNdlJ0fqVNvcZqbJTAbg0PQ5IZ4Dp
	zy9s4CuheqrjcxG+FBsWqfrrB936qfhFnoBykVNAOEcP9rTpTX5hVZAWn0qKjmEb/5BPaH
	dudgZKxdGnduwCjuGBnY6g6CfuzkeO7VwsU06XizmQQWNJ03jrHA5eyTg3fL6g==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <maxime@cerno.tech>
Cc: jagan@amarulasolutions.com, michael@amarulasolutions.com, Chen-Yu Tsai
 <wens@csie.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, "open list:DRM DRIVERS FOR ALLWINNER A10"
 <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Allwinner sunXi SoC
 support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Allwinner
 sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list
 <linux-kernel@vger.kernel.org>, Roman Beranek <romanberanek@icloud.com>
Subject: Re: [PATCH 1/1] drm/sun4i: tcon: Fix setting PLL rate when using DSI
Date: Tue, 21 Mar 2023 20:55:32 +0100
Message-ID: <87a605hmo5.fsf@oltmanns.dev>
References: <20230319160704.9858-1-frank@oltmanns.dev>
 <20230319160704.9858-2-frank@oltmanns.dev>
 <20230321145739.jlpbzplsc27dlh7v@houat>
In-reply-to: <20230321145739.jlpbzplsc27dlh7v@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Rspamd-Queue-Id: 4Ph3D35wsCz9sJB

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On 2023-03-21 at 15:57:39 +0100, Maxime Ripard <maxime@cerno.tech> wrote:
> Hi,
>
> On Sun, Mar 19, 2023 at 05:07:04PM +0100, Frank Oltmanns wrote:
>> Set the required PLL rate by adjusting the dotclock rate when calling
>> clk_set_rate() when using DSI.
>>
>> According to the Allwinners A64=E2=80=99s BSP code, a TCON divider of 4 =
has to
>> be used and the PLL rate needs to be set to the following frequency when
>> using DSI:
>>     PLL rate =3D DCLK * bpp / lanes
>>
>> After this change the common mode set function would only contain
>> setting the resolution. Therefore, dissolve the function and transfer
>> the functionality to the individual mode set functions.
>>
>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>
> This is similar to:
> <https://lore.kernel.org/all/20230320161636.24411-1-romanberanek@icloud.c=
om/>
>
> What=E2=80=99s the story there?

Sorry, as Roman wrote in the other thread, I submitted the patch after not =
hearing back from him for a week. My apologies, I wasn=E2=80=99t patient en=
ough. So now there are two submissions to consider. FWIW, I think this patc=
h is a bit more straightforward than the other one.

Best regards,
  Frank

> Maxime
>

--=-=-=--
