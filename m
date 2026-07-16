Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249DF23BD17
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jul 2026 06:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182795; cv=pass; b=dcQRRQc0Fm93OFVvWdfpUbq4aA+aj0JNvvjFH50WyXULW+ltFcpcquKBV/IsLtrK77Viy6/xjhnyZBOFbmgFjEx1nS4dodSNMhreiN67dZ4Y7tyzdfD1INXDmCmw4BfkItqoc5JZcLUXNxGvYeYCp+b9+IFZSKk2uhqKl/Vuaxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182795; c=relaxed/simple;
	bh=Z1xYzaKFoC7KOhHV2wOjYI5julQTrdp2ki63LNelNrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIOY7QmYCaImsnwSFXeJagNaby3l9Qs0jZYQ9PHhkn/uej4U1W3qgSirvwq29dIEWbqjO1ZNXmAIX6/+qHXtmOaaqd3elZrcnPhzkVn/kiTI2RjuOCdxp+F6+e3Z5pG9MwCnlZHtUPoL8uM+/3MU6T4XTVuwmIo1/PW+A1P3vXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOQNVLjP; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOQNVLjP"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3799401a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 23:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784182793; cv=none;
        d=google.com; s=arc-20260327;
        b=KniIMyxAqqcQsdGp7Y2akWOiaJ0olpCfifx1FKvyJGc30HktqVdQcPxrM3ZdAMxBpZ
         A9NAusn+TzDshX92d8o9+3QcCpGW/G8nmPgNL9fQQD7WdXbBMj8a0vR9294lVRe6+1P/
         7VmOsy6AUV05GOO+fYwwpJKzf8zttFR/htUgqHwTuWB6MKjTxHapSeVoFOXF0J403Am5
         od3uw6phIE284w0TB8DUlpmVVGL5fVM3mL9D44smCyxJYDWo0PeqRFfbE75pydTflRiU
         CGq0a8ZsFOMNYCaO133X6/gostFy/DzoSXGc26WWl3c7O8i7Vi4vMDhS8VWsSmZ0vROB
         DrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        fh=cym+0fbsKA4YxOiGBiL5RAE7j+vqdGuJFvX97Ew9scA=;
        b=LPp+h5tH7UrQcddBwswkP05b3LBpV3KbqM6VRrVrI+apsikIZbfnp0N4wwYCNY1/eh
         zMfmNfZLMXLHvGByd0zUP0rYaqXZynB1M1iPLFfBhcoYn4+vQmaIklP0qGRHByghMfmA
         pIYeuuDYCsNAxkWa8AqxgDtftCzsBOUpshhizTri3ZOwHUuKCzMf7pqcSg+p3/vQCQwk
         I5tP5Y7dSehZQ2uy1rUM2IODSYpnuTHXKE+U/XGvXGG7KqbUKDseZfvddoh55/QU19ch
         MDXpSVr9HI0Qn9zyBECnnR12WhbIoYBN//5N5bEB373RgTlEGQuB+8bkARon/8Wpp28f
         Sn+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784182793; x=1784787593; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        b=BOQNVLjPG1n5f5cbCoTWbx3MmaNDCe3TTPURD65Low9LOiP4XnABS2e6TMNn5NOaD5
         fwCLnGyktp7XDlpGqsA57PpS1GhsuBw2U2Pc7H2iEiTGn+vxewUKLpwhtYrvrwSzw2Lb
         V3Obnrnk2AV+1qVq7jbpA9GGW6UUDzmtVPISm1i4qKjDVmXWEfclFEjPzkTWTK5OWDxn
         vB7izAcdgqq/ooIyUmWfh4420FpLpcYLM3d3IHpXI6LzBxjmW7ZVHTl4IWc2hngzpI0j
         HlBVSL5lpZYZrzfvTSs+a/lym/75UGBZYEVmBimscyU3xC6N9CHWzsNHmysE2cdDaE3B
         A7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784182793; x=1784787593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        b=TkgqUIItGcPfXOUO3I+n8ju8n5js9Sxj8T5H5mpQp5ASXdTqm8VRazxvLUpsk13Bim
         dPTWl2ODVceEPc1IIzhmwXPiwmPKSNOFZ6jKvblfbKkgmnrLMc38LIqhJNh3Ns59+jEU
         +n4I+B2FhrzVq4KNyF+ctE8ZfchAso1y3BYpYhy7T+cHSiCa8s0bK4YdIn7388LDy/v7
         gkd9tEXAvalBCU2aEMCKRv10gWveVktTwuO5+8RjoilOYbNdkIEueANCKSn3k/rcIK5l
         1ZreOHbJuzipBy4mekklmnIHOuaqbxFLKKWFwHZuMF1/+xOtb0rrQKtc7zZepmvaLaBJ
         7QUg==
X-Forwarded-Encrypted: i=1; AHgh+RrGFL4b3IUDqN6VJVlk9zTXDnIGxVa3ZMnCqcmJm6Jqd5rPxzC93S2RFAeTXc6ei1NzKpq71E/lF0bFtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhboWTYFzuVCRweOy2n2ZKwByfbCrFiY+RJQGhJrg8vjnC4daB
	L0b0ylqjJ6gVOtOjGTeKNGEirq+vB1lFS3CBgxBVYqu/UHRFnaPE0qVD2NX48vMsUrZmCsEfMvF
	4KTJVUIGKll7e+bwqcpPivluNAMTubBY=
X-Gm-Gg: AfdE7clpz6FhrygfVjwyi4pv1Kr1rJcpQ9Nsn7zSH7f0JG4pFfshCBW1WV9q1oHuXKT
	vUHiPfazAskOUw7QG9UzVmYBpqV0mbWMce1zDBG9PJ7VC59RENfeeEg8a9ErRW5Vo9Y+/Pw7MEA
	WGzcFfBQhZFQ6ruY5kzChyytcUWGhYz9ofBnODE7WTvBSaDZgyjOiBr/yKVIxIu2JcraPzHp1dj
	7trcmh+25p/vho3PewXbypjnyIQddmqdHEWigbzM+9zasZy/uuKczjVMH/cibIABBA867BF2wU2
	dS74iAKJAHrrTCqH
X-Received: by 2002:a17:90b:2b43:b0:38d:eac8:2dbc with SMTP id
 98e67ed59e1d1-38e29f6c683mr4862337a91.9.1784182793361; Wed, 15 Jul 2026
 23:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
 <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
In-Reply-To: <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 16 Jul 2026 13:19:42 +0700
X-Gm-Features: AUfX_mzLT5bgNmawwyrEk5EUD4UBu9qW-wp_xIJKTxIxw3V-_Jn5uIqdk4DToog
Message-ID: <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: wens@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chen-Yu Tsai,

Thank you for your review.


> >         ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>
> snd_dmaengine_pcm_register() doesn't seem to print an error when
> dma_request_chan() fails.
>
> > -       if (ret) {
> > -               dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
> > +       if (ret)
> >                 return ret;
> > -       }
> >

You are right that dma_request_chan() itself has several code paths where
it doesn't print any error logs when it fails.
However, if we look at how the caller handles the return value of
dma_request_chan():

---------------------------------
chan = dma_request_chan(dev, name);
if (IS_ERR(chan)) {
                /*
                * Only report probe deferral errors, channels
                * might not be present for devices that
                * support only TX or only RX.
                */
                if (PTR_ERR(chan) == -EPROBE_DEFER)
                        return -EPROBE_DEFER;
                pcm->chan[i] = NULL;
} else {
                pcm->chan[i] = chan;
}
---------------------------------------

As shown here, the code only propagates a single error code, -EPROBE_DEFER
regardless of whatever other errors might have occurred. The reasoning behind
this is already well-documented in the comment block above.

Therefore, keeping the following error log is not particularly useful:

----------------------
ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
if (ret) {
        dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
        return ret;
}
-----------------------

This logging statement does not make much sense here because if the returned
error is -EPROBE_DEFER , we should definitely avoid printing error messages to
the kernel log.

Let me know if this makes sense to you, or if you'd still prefer to keep
the log with a check to avoid printing on -EPROBE_DEFER.

Best regards,
Phuc
