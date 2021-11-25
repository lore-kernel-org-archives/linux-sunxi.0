Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16422C81
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Nov 2021 23:29:08 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id y68so15554567ybe.1
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Nov 2021 15:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=blV1Fv4hcoWLPMa9NW0Mv4Ujudwc+s6b2OZ54WL07S4=;
        b=B7NOz26Pmz+F1j1/yC5jIMhWQfKW3I4PpkKMqY9vLq58eituVy9/c+ylRVHb/kxIQs
         f0sK9lUobylZRYu3Qq9jWYFpzlZesA0OKKVv0dC74LaBI5Q/wvgPQcsEKoqr8kv+Ib3+
         afmy+J3+IUoSJWHKT5vzZAmGxDxzrkSPepoiU1Loanrbj98eiiQapT11+/qOChtes+kz
         NeKn3U/+bZOQzpAN8ZXoLhHGU7s+0oS7grt85jit2aRBtOoxlqLqffW7YtQBwC5PFx7M
         IkF8lrRxRaMp5RUVO1+Sbx8VQEv9reqZTT6JihGFwU5KwB//Za3e4dZKZdm0xlqpCn1R
         /UrQ==
X-Gm-Message-State: AOAM531kziHhTafXYgcQoMvFGEWwmee1Ve8XO3WguaAxky7YmLCSX9Mg
	boHNeNABMTdFprFJK9w9lGRUIiXlXdad8xJICUo=
X-Google-Smtp-Source: ABdhPJxqAoOcr1wx1llTSS3Z489P1w21Bx/evl9uijsb35Apz8cCAD32funRnACdZQbh02+XLSTjm7lel8mdyMh18Jg=
X-Received: by 2002:a25:c987:: with SMTP id z129mr7183395ybf.62.1637882947711;
 Thu, 25 Nov 2021 15:29:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211125172021.976384-1-mailhol.vincent@wanadoo.fr>
 <20211125172021.976384-5-mailhol.vincent@wanadoo.fr> <ed755990-4169-604e-d982-7e4370114512@hartkopp.net>
In-Reply-To: <ed755990-4169-604e-d982-7e4370114512@hartkopp.net>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 26 Nov 2021 08:28:56 +0900
Message-ID: <CAMZ6RqJWdO3tvOz020Ee_zcFnJDFWO9qxM7Rtjw2+n_o79B+cw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] can: do not increase rx_bytes statistics for RTR frames
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Jimmy Assarsson <extja@kvaser.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Yasushi SHOJI <yashi@spacecubics.com>, 
	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>, 
	Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, 
	Stephane Grosjean <s.grosjean@peak-system.com>
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On. 26 Nov. 2021 at 03:50, Oliver Hartkopp <socketcan@hartkopp.net> wrote:
> Hi Vincent,
>
> On 25.11.21 18:20, Vincent Mailhol wrote:
>
> > diff --git a/drivers/net/can/usb/ucan.c b/drivers/net/can/usb/ucan.c
> > index d582c39fc8d0..717d4925fdb0 100644
> > --- a/drivers/net/can/usb/ucan.c
> > +++ b/drivers/net/can/usb/ucan.c
> > @@ -619,12 +619,13 @@ static void ucan_rx_can_msg(struct ucan_priv *up, struct ucan_message_in *m)
> >       /* copy the payload of non RTR frames */
> >       if (!(cf->can_id & CAN_RTR_FLAG) || (cf->can_id & CAN_ERR_FLAG))
> >               memcpy(cf->data, m->msg.can_msg.data, cf->len);
> > +     /* only frames which are neither RTR nor ERR have a payload */
> > +     else
> > +             stats->rx_bytes += cf->len;
>
> This 'else' path looks wrong ...

Ack. I will send a v3.
And thanks a lot for the review!

> >
> >       /* don't count error frames as real packets */
> > -     if (!(cf->can_id & CAN_ERR_FLAG)) {
> > +     if (!(cf->can_id & CAN_ERR_FLAG))
> >               stats->rx_packets++;
> > -             stats->rx_bytes += cf->len;
> > -     }
> >
> >       /* pass it to Linux */
> >       netif_rx(skb);
>
> Regards,
> Oliver
