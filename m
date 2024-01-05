Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F4250EB
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jan 2024 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3+ObJ25y"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so6649a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jan 2024 02:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704451713; x=1705056513; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oA+DfvkF/6fqh1TmhIwoR/ZJIBR+b0c6R1YFEKfiMo=;
        b=3+ObJ25ymGK4HZKyl3zxiEDtEsAie19Gg21eQBuizx2FcKPXCfXfQjOVqrxywp/xou
         U1rrOWd0VzT0l4lbzuZ/PvTFR0cYmz8hG70n0sGRDPEyKGS9E/fWfl9zS08tlM2tU8rh
         CJ7M92luXmmJVAvhfCnPd5MgDgMpTBtipkFFHFJ9a+v3D9Jj6+WlzcD25QcgdgEFuCZY
         tXKPWXIoHvwYtNHUTpeF/yv9vsNJaIsziypOKhayG0UBus3lMYKjh7Uadqj0udfpAEHP
         NrFc6Ts1SR+w0ADVBi+1/N6r2nL0yhipakgYSvHg9mQQF1fdKlEp/vGRVwx2M1KjfnVd
         L+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704451713; x=1705056513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oA+DfvkF/6fqh1TmhIwoR/ZJIBR+b0c6R1YFEKfiMo=;
        b=vKh1IE2pVYSxBZiwL8VNZi/SF+xZMSka8xqEVdl+M96MwTZGfL+G8GE75rftFTUBmX
         btF1/wexaqGYiyjORjWMpkUfe5HQlS8p3iXw0yYEAGoxWkTzFpHyNMol2GlUBtzvAup0
         ijbE9/x5AkZqlkDIdH9ZYZikV/TLHVRZNIabufcq+UR+g2McwRYBXNy3/CBXnTYERnkq
         3eFXuvOruH6cwlOTfTY6UIzYFGwaY4EPvnOxn8QWPGlTpbUzxkqMVmXmRHAZocCoM0Z7
         OQLaD1XRJQOFMvG4mR84ofhVTHB9AgQ82o9iJnx2GdHIwPf3qF6H0zWf34uVJV+QdS2K
         1nNw==
X-Gm-Message-State: AOJu0Yw4I0FkMVKnCfTNxGDKHH145riNWvXPWBkyikcbNpojae2Dx2Fo
	c41fTNTeGdOadcjCbZBu7MAVg6o095jLRmcT1ISkIKNzyZq4
X-Google-Smtp-Source: AGHT+IFv0vnQPWdLPrQsYnDtRDca919RUkeRsM5oeQs2Ots7c0R+6Lp39rU3ebTS/BDKx4md8p4+GBkyTzo7A8Jpejw=
X-Received: by 2002:a50:c05b:0:b0:554:98aa:f75c with SMTP id
 u27-20020a50c05b000000b0055498aaf75cmr101190edd.5.1704451713227; Fri, 05 Jan
 2024 02:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240105091556.15516-1-petr@tesarici.cz> <CANn89iLuYZBersxq4aH-9Fg_ojD0fh=0xtdLbRdbMrup=nvrkA@mail.gmail.com>
 <20240105113402.0f5f1232@meshulam.tesarici.cz>
In-Reply-To: <20240105113402.0f5f1232@meshulam.tesarici.cz>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 5 Jan 2024 11:48:19 +0100
Message-ID: <CANn89iLEvW9ZS=+WPETPC=mKRyu9AKmueGCWZZOrz9oX3Xef=g@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: protect statistics updates with a spinlock
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 11:34=E2=80=AFAM Petr Tesa=C5=99=C3=ADk <petr@tesari=
ci.cz> wrote:
>
> On Fri, 5 Jan 2024 10:58:42 +0100
> Eric Dumazet <edumazet@google.com> wrote:
>
> > On Fri, Jan 5, 2024 at 10:16=E2=80=AFAM Petr Tesarik <petr@tesarici.cz>=
 wrote:
> > >
> > > Add a spinlock to fix race conditions while updating Tx/Rx statistics=
.
> > >
> > > As explained by a comment in <linux/u64_stats_sync.h>, write side of =
struct
> > > u64_stats_sync must ensure mutual exclusion, or one seqcount update c=
ould
> > > be lost on 32-bit platforms, thus blocking readers forever.
> > >
> > > Such lockups have been actually observed on 32-bit Arm after stmmac_x=
mit()
> > > on one core raced with stmmac_napi_poll_tx() on another core.
> > >
> > > Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> >
> > This is going to add more costs to 64bit platforms ?
>
> Yes, it adds a (hopefully not too contended) spinlock and in most
> places an interrupt disable/enable pair.
>
> FWIW the race condition is also present on 64-bit platforms, resulting
> in inaccurate statistic counters. I can understand if you consider it a
> mild annoyance, not worth fixing.
>
> > It seems to me that the same syncp can be used from two different
> > threads : hard irq and napi poller...
>
> Yes, that's exactly the scenario that locks up my system.
>
> > At this point, I do not see why you keep linux/u64_stats_sync.h if you
> > decide to go for a spinlock...
>
> The spinlock does not havce to be taken on the reader side, so the
> seqcounter still adds some value.
>
> > Alternative would use atomic64_t fields for the ones where there is no
> > mutual exclusion.
> >
> > RX : napi poll is definitely safe (protected by an atomic bit)
> > TX : each TX queue is also safe (protected by an atomic exclusion for
> > non LLTX drivers)
> >
> > This leaves the fields updated from hardware interrupt context ?
>
> I'm afraid I don't have enough network-stack-foo to follow here.
>
> My issue on 32 bit is that stmmac_xmit() may be called directly from
> process context while another core runs the TX napi on the same channel
> (in interrupt context). I didn't observe any race on the RX path, but I
> believe it's possible with NAPI busy polling.
>
> In any case, I don't see the connection with LLTX. Maybe you want to
> say that the TX queue is safe for stmmac (because it is a non-LLTX
> driver), but might not be safe for LLTX drivers?

LLTX drivers (mostly virtual drivers like tunnels...) can have multiple cpu=
s
running ndo_start_xmit() concurrently. So any use of a 'shared syncp'
would be a bug.
These drivers usually use per-cpu stats, to avoid races and false
sharing anyway.

I think you should split the structures into two separate groups, each
guarded with its own syncp.

No extra spinlocks, no extra costs on 64bit arches...

If TX completion can run in parallel with ndo_start_xmit(), then
clearly we have to split stmmac_txq_stats in two halves:

Also please note the conversion from u64 to u64_stats_t

Very partial patch, only to show the split and new structure :

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h
b/drivers/net/ethernet/stmicro/stmmac/common.h
index e3f650e88f82f927f0dcf95748fbd10c14c30cbe..702bceea5dc8c875a80f5e3a92b=
7bb058f373eda
100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -60,16 +60,22 @@
 /* #define FRAME_FILTER_DEBUG */

 struct stmmac_txq_stats {
-       u64 tx_bytes;
-       u64 tx_packets;
-       u64 tx_pkt_n;
-       u64 tx_normal_irq_n;
-       u64 napi_poll;
-       u64 tx_clean;
-       u64 tx_set_ic_bit;
-       u64 tx_tso_frames;
-       u64 tx_tso_nfrags;
-       struct u64_stats_sync syncp;
+/* First part, updated from ndo_start_xmit(), protected by tx queue lock *=
/
+       struct u64_stats_sync syncp_tx;
+       u64_stats_t tx_bytes;
+       u64_stats_t tx_packets;
+       u64_stats_t tx_pkt_n;
+       u64_stats_t tx_tso_frames;
+       u64_stats_t tx_tso_nfrags;
+
+/* Second part, updated from TX completion (protected by NAPI poll logic) =
*/
+       struct u64_stats_sync syncp_tx_completion;
+       u64_stats_t napi_poll;
+       u64_stats_t tx_clean;
+       u64_stats_t tx_set_ic_bit;
+
+/* Following feld is updated from hard irq context... */
+       atomic64_t tx_normal_irq_n;
 } ____cacheline_aligned_in_smp;

 struct stmmac_rxq_stats {
