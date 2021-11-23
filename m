Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7B2C82
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Nov 2021 18:11:03 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id y68so61871186ybe.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Nov 2021 10:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MUbZEn/3SdS1wqqgUfSx8CmvXfjoSF7ouvMsnJiO5NA=;
        b=mJpAe9L3s409U8oAfzbvbhRfynnyxvlYEfzfjmQDh5930EJCyKHS7OXrwlMS7RCBRN
         r3zgECnVRDEoTH46vfOTDimih8m6nLa1dLT6aMNbzy0TpjkR7RrEgeyHwWsIbHIFtl/3
         x+bWUMNjVXDs8zaRsluO+jhPDMePWwHOaynMwV5fmT+aC1yukuDvFoa+SocVXEmzPHDy
         xRFwPwHs2hnIqt2AooY/5jXVfTpdf6z4LEhrbeVohzOxys1iBe3AMLxe62Vgpm3YtZwq
         IfgHALHxFgjg89guNPUktijG0O4RQwH29N9lJALF4XgvuOR9saYr7HvbmdOU5H4HFjxP
         5Dhg==
X-Gm-Message-State: AOAM5305wvY4lqkpNqJ3gpDQAfjVl+SOQqIkQL68iMsPTt7t6Ohn4bGo
	OsVDFsjl3uNISAjBlZ69zP5Q9Ly8EAQur050yl4=
X-Google-Smtp-Source: ABdhPJxRFhK5k5paqCyxrIeq+pgrATdTva88twcto4HVEG4JbbIHmOdJnz3Ra/cinSMh+cljZYv0Hji1HsxZMD9JErw=
X-Received: by 2002:a25:ba0f:: with SMTP id t15mr8897642ybg.62.1637691061954;
 Tue, 23 Nov 2021 10:11:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211123115333.624335-1-mailhol.vincent@wanadoo.fr> <20211123115333.624335-3-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20211123115333.624335-3-mailhol.vincent@wanadoo.fr>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 24 Nov 2021 03:10:50 +0900
Message-ID: <CAMZ6RqJEFvn9f8quYWyfPL+A7hjLJG67tQenTsearuF-5hcEsQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] can: do not increase rx_bytes statistics for RTR frames
To: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Jimmy Assarsson <extja@kvaser.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Yasushi SHOJI <yashi@spacecubics.com>, 
	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>, 
	Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, 
	Stephane Grosjean <s.grosjean@peak-system.com>
Content-Type: text/plain; charset="UTF-8"

On Tue. 23 Nov. 2021 at 20:53, Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
> The actual payload length of the CAN Remote Transmission Request (RTR)
> frames is always 0, i.e. nothing is transmitted on the wire. However,
> those RTR frames still uses the DLC to indicate the length of the
> requested frame.
>
> As such, net_device_stats:rx_bytes should not be increased for the RTR
> frames.
>
> This patch fixes all the CAN drivers.

Actually, I just realized that we also need to fix the tx path.

Since [1], can_get_echo_skb() returns the correct length (even
for RTR frames). So as long as the drivers use this function,
everything should be fine. But the fact is that the majority do
not (probably for historical reasons).  Long story short, I will
send a v2 in which there will be an additional third patch to
address the tx_bytes statistics of the RTR frames in the tx
path.

[1] commit 59d24425c93d ("can: dev: replace can_priv::ctrlmode_static
by can_get_static_ctrlmode()")
https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/commit/?h=testing&id=ed3320cec279407a86bc4c72edc4a39eb49165ec

Yours sincerely,
Vincent Mailhol
