Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192177;
	b=w3vMuDRRDNWFf8QLw7RJe/1GFbT+CDrb9L8bob9cbJbkJNlpmjNZG0f2/8HGowarfaNX
	 r+elngGb0ywdcJdpcenP6sTZPBCDuJ8p87pqZnljef1QLUrmaGouAd0Z+ByG2jBDg6yLy
	 xZ/MSuqVE2CD/QGqFk7Oh2gaFBNsBuEfb++a75XAAIyq7bQbbUA+Rg8yIwQsKvX/J/4Wn
	 gMCEeu5aj31vqclpxL6drv8uYAbViRLOGBfDKWenQmnePjuGBCb9t91fY5ImszZHn4QEf
	 KGMPWxzjM8UEM8dK/dxRrrDrn1CZGypbrFHeHPPdFp163Zgn1ztIUeKVa5FK60aZzJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
	b=0TRpa0f9ailyuWBw9sAm/vQAUBQGotfBynPAdTk2GbkmyC1Mnpx/Nv/XK+TceRfmOvhB
	 FrD4maqd010jx/06GsIST4eFxVvdBEgAnx2SyRdHhw4E5WA+aLeQ8O7qV2n7vsXZFScfW
	 1/rex4OxNQ8bDJeO9Jo+/+HhdnYhpZYmWPCQw67w/XfLHNvaHrn8WyCUA1Dycq/5CubZM
	 XOc+O1Xwq68O71wGvP1+2LQNWunr5FXSBEpGFbFWsxKxPW7roW2V5Fy1zEyE2b+v3o+Qi
	 2Lvmnst8A2ymxcELLaUwrD55LMqUxtwY+h3LP11AmBRb2NxQOUpMO43wu7conX9k9ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8nhXiKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97367606A337
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 16:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97367606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8nhXiKn
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-77bf892b496so397934137.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 08:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192175; cv=none;
        d=google.com; s=arc-20260327;
        b=HKG/JGCFwCNecMYDjlkG2NWKzqMOVpIUnWN1eeT0UetHGr3EAqU0r6qEroIKIH+kou
         6kKDM/XQ4ZE0ZLgJ6xjjxG7rJ3+yD3JweRliFmFwnqDCHMKTAtwudipNIZ9CAM1ThlHY
         +3+cbZ+tZBplLCSezdLqRHRJy1otPLoNJzHsKNevzc4LRAgjekzvwBBF9ZKXLdHValqk
         p8t1DjKuYK7Dp4fma7NHsdF4rj7a9MN0sOI8gGDOO5934ArG92bdMAh+gKuacHtytw8k
         OOvnO3KmYXjdgLQO6mD4AziCRvvgjZ0LycWFYLjpzk01DCtguzCE0igfDat7KnsHa5yt
         gUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        fh=wYul4jLL3aIIioD/w3DuAlwpvsGELuIAB1Z+gv8+Fho=;
        b=RrTb9HF2mKYk1D2MIiB3gT9Dfyxk3qmrf9XtpDAZrQiyHVD0wuJjzkZk3xQrcXlzXP
         8xvuD+8fpvmFIcU5MOrxEyHBfIqT85vGBlTSADjb5aBMrD0L5+L1rRrMpG8skW1tGikC
         J3ar13ftbK5mu3AU5trknBQMUQdBTfqg/3YFaVh3fdmkq8jrJ4zbXW/dY5UL/aomtIFO
         pNT5IMsVUo7YXiIZzXl4Cv2XmDZhg37u/NPNpH7MvR1Pue/8ww4CBa77rTEq3J/Mj8UZ
         6RA/b0Hom55r+hH8YD7H3o9foVbvegiNx3TcXNjm7Xle2Bq+BYn1MfxH14EIrChl9DQ6
         MvLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192175; x=1795796975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        b=l8nhXiKnL6eSd1ri0v6QoDnhN4qDduX+/XOG06nls35gA18iKN4CRVj//MB4C5SnbE
         g/FfQ1YXALZOqEeuSRDlT/ztY9s+CFmLVRSJxwO1I5ox6/VmTabdIW2bbZp7T9oRpAqd
         ng9/yjAHD/NsusN4C3/M0+ZeU5iTw7F7jkdXya5Ypra+RdN1DZFr94iuYt2gyKfD69nh
         v8mdAr2XAe4bifGbK09VZKSe0nK4vdst2REN6MFnO40/9Ls5n1+/yWr40wAREE3nv24+
         wBn7+dVD5gr/o2M6vmKIraGq2gbCe8Uw+8A2WFKVvTkEbxsQbmkTsSEae/ikHKLAfVu/
         UlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192175; x=1795796975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        b=ZBoTg5eY6sJ1wfK/s3Ufi/aEzmLGHIxkOJkmRvFn02bhcUmAwfTP8emj4iNjfMWow/
         ykNrBoh/DYQsqFZEAiy0omn8c+KWf8bnCptZTrv+sQE20CNo3hbQ0r3lHOjBMhui4uN3
         9J5TZAIKDGQe8sG2UfT8fXEPLHWEu9GN5XXvVn+yL5anTQ5684JLUwdptlp/mwWteY19
         7QuDupOMDedqQuF0NnLWnKHhm++g+mekfb3usnVkfDpoOOWxE7qvPGbmjDmKwslwrc5n
         KLMwf68Bs3jEzHsu2FssKOre+vDQcNco1aqyS9lPkFn8+43IINM8Qz1DJNeElCmUEU2W
         e3FQ==
X-Forwarded-Encrypted: i=1; AL+hErGl/+gonba9TSauPDAJEZ8EE50q6udA3YWX6od4zgGmaSuQLktyxS89z4pt5zaTjlmFnhddewRfW24/AA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/7p5ZsODV5JjaU8MjxWDBSoeDADoPQvaD3tWi3rhCXiOyRDrMq
	1B+kqki8TvIBTDmIUpbc+3xqZu/Jey0pQa0nDFySrKRnGIGS/+4kHfS2OWh1RoSFRCzmLnq930n
	//SibPlJ3Hn/vySKyo+dx1A5ISiGZ6Hk=
X-Gm-Gg: AZFdTZdm8kUJjbMrcMzjgtyw20KQsF2mlXAtkfcxzv6ilyh36Y4NT3CbTCZ09a7GrRV
	BN4XdjGZQNh6qS5GBzExq+kAJbMpYq+SVMytTfVUM5JaCqp3k7qadoC8cw3Sya2zroIkF/tE8Mb
	wFDXbhS1vYu/nWNdx9KJXBajH+UI8WhgLldd6/MHU07RTZ1rSf+/T35bnxOQfgEYrONiUCiJ6LI
	Ol/wYi9G4/N8wX9m3YEuzTV6EREgx7GzvyUYSNol5iTkhYBLugd+9stflnZ4ZG8l416e2p7aU8n
	G6G+zH/LpcFbodqK2h+Ed44FUKPZ/dPr4PEM8rVf/pegITAW5AezgljZJM1h7+QzAzFauSzRRoj
	VOszyCsEyM7EkVxPu+D3JltovNno+hoW961JHsGH+2LLOAEn+NMfgqOJEOKAVy4ZJx8hwviqFio
	95CyRiBm6cyJGx6/0UnI5OarRBsxU5N1Dv09/vx+kOfMJYMcTm4Ke0o0pJjucAEMcIgYl2JQzgE
	WgXoFggb9zJONYrAu9JAK9GeUNN4hQ=
X-Received: by 2002:a05:6102:c4e:b0:7d2:cddd:935a with SMTP id
 ada2fe7eead31-7d739452145mr1508690137.16.1795192175491; Fri, 20 Nov 2026
 08:29:35 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com> <179518906382.3291.11090310469167736540@kernel.org>
In-Reply-To: <179518906382.3291.11090310469167736540@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:29:23 -0700
X-Gm-Features: Aa3M54rxvRHQ1SE3EhRHaS8AS4LHAflcS3ypLersCJii7Z97A0x6odnETYQXmBU
Message-ID: <CADvTj4pcueutmeCv8VZVSEKDZf4F0wekqYE3hhaJf3eWdTR-Dw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:37=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This series came out of Jakub's review of my earlier dwmac-sun8i
patch [0]. I found the original issue while testing on an Allwinner
H616 with an AC200 PHY: the MAC dropped packets with a bad UDP
checksum even with RX checksum offload disabled. My patch fixed that
case, but Jakub pointed out that a bad transport checksum alone should
not cause the MAC to drop a packet with offload enabled either.

Jakub asked to see the full fix before deciding what to apply [1], so
this series replaces the earlier patch and handles both modes.

[0] https://lore.kernel.org/r/20261119144848.4ddd88cb@kernel.org/
[1] https://lore.kernel.org/r/20261119161151.5251fc86@kernel.org/

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
