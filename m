Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196030;
	b=k7zRLcijZ2DhnSnZR4HFg+5v6oqAm+uZayQjjQWmh1qa4bsLdCHzLuCWfbX/oh1ogK93
	 56UlHPQNc9dImqeWJdvk4mi7bE0EBjg5esSGfLm3hA/YN2trq9pPuajY/ItBexyA/C/tQ
	 A2PVSu/ebNbPGDx2/9GJrHhz47BJT+IxtVD8dMNXZkL+YUo+Z8qqo+5WmB5noggTr/nBI
	 +GkEDPPOSJdX9yQ7U9QDvD1sWa3RmU4FseD7nob4eyuVIOp3vJiBbYFgmrn++zfa3W4QF
	 b/j7I8879Y7FeIYoUOk93XDHEuRrVgXNgFzy5+jAVzq1rw3NB/PGe0xUV0aAlIEKOPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
	b=X01Gd9mColt6O4fTqHZzgpehTZSOjhTO+6oaN+2P3jf9AvoaFaqnTTtxrF5Okk5k5VqZ
	 5cCm1luc3iRkv9/Y0jLPe9CsECMRrs9ploh1e7PtI8QFp6nKVIAkH51OICsAEbrESiAGK
	 0E+ptqG38jepNzjnzSFznpDBpNlhSlrFzJ/evcKbEs0tjwaW7ABC40pLF9kOEy1Fapq9D
	 YAJc8Jsymsxsb3TQ2V4lyYMW84LZ0mKU8ASJ4udZSbrGMwcpNUgEC9kik+UJt/VGG8ir+
	 Bz1ejQ2siXILc2OyEZVhlXNSX7upcQs02rEVyM8wKdNHFuHxCgBbZV8iE1PSUA7OKGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QuHG/t82";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC5E606A339
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC5E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuHG/t82
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac01ff101so414626e0c.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 09:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196028; cv=none;
        d=google.com; s=arc-20260327;
        b=ddrIwu0ZHOSYGW9z5/BBrFOU+C2wpwq4QWuLkRxnWBCD/zYJjJWNKZHDEkTHqJoQt+
         XdtVyuPJvPORO+lWHLdLkAR4zI7E2OaTnqGwWAHykn2bmGHwRfsgD/sVG6j1GYgNvK2S
         6nCh7HJqEjfufN6/EIsXtODEfNabZK36giNyama9o+gwzppTyClxxHkYE4TeWM5XBhF9
         0j0mHoXCynFcG4Jn8E9fie0PfTUv51W6xKeE/RuTBze8q/07EVcP+59+hXMufmqe31yY
         uq5MHD7zw3js9Ry+r3W8Q+5bAgNLr9ZMVU4PfAa7k0aA6zEGhCRBg4/2kP2BGXwVXbLn
         mryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        fh=CtdUx7qDeSVP0igSE1S9fE3hJ6kWRjFklelPq2Cd7s0=;
        b=forXW4EKuG8H0ZtpotOtXfq7QnM8GXhCROEFJ24lLqKo/li0HC4nMj5h1H1B0oWjrW
         Rp4xddlJqcUDrLw5YDEkRFj17qwI/CGKzFUqD/CNNRYmdjX2gN+gK0aRfkMQAhEGYuqV
         fNMHL5r63cXUur4gQY8rS90BJ2qL0kx4YF6TZYdgzwOZzaD7DZpthMMpEL0XbbmAKXkI
         UWU9ovMRvBgegDNtQmw86mJPiYcmKt4kABr1uGeRMpV75xDfZdkEVcqb2nnQ0yA67V7W
         6W819vGJRfToqUARNxHiz1dGtNvV4QRve7KgENz5eD1strNMIU5kxVH7Rle00Isx7VaH
         RwhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196028; x=1795800828; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=QuHG/t82zfbQLwqUyz8YYmovLCx7o2bGLDSJGZN3vDwfcBr/nB2Ep7BEk0CbIUp1hc
         /SC20enAAtJipE9W4rlUUBxCZiWtoO+bTRmutQaiKoJopJbkejjQc27XbOr21Ii33fR5
         /EC5TM5Mksu9InVWY1z+y26HVtKFxTNHQ28ItNEuz7VrXRBjvmJiC2HED/+kOH8i+zVl
         nOf3H16RuEcycDSyv7GfI0J/R7KDYwXAKboNs49bP0+496Bn56Sm46f1BwP0R/ffN6v/
         ZXEDIIUWsFkk8Pvi/Fy85OR1baf96KY+tBnjHiJBLYiPhI0Gc1UWOjIrv9iRUaEnByMb
         CTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196028; x=1795800828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=i1yWSa6J87BhFKHjUiSiBfVg/6v/cnRQpFKh/JpEMQ2CipeA/CuKNLunsTS+iCsj8a
         Sr9Tia3WNhiHvHKMR4archBwDXgmePgug7tCCJofuVJ+HKo8Z7OKek5Nel/7cEm57zu5
         RtY7skhju983wYRHw0uSoVrd/fFaFr1z3eLYAEXC3j/PPHYlIvR2O+/EEwXu3iIVlusb
         UPVt6gpwy8pAUsEZ+QcuNtKoE5Ge+Qcn1IPZMSRJpiILD3S8eaD6B64HTo01he+9CqYn
         jiCnX8c4Mv81C+sox2dtvOF2FgbnyDsM7BGF7KBKL9neK+n7zMoXt4yzrW4izQZbD3Rs
         2Anw==
X-Forwarded-Encrypted: i=1; AL+hErG8aNUFTE1VRM8/JJYBeDVUpyhCc0Tu4Ej2UEshewrpeJ4TkTKzeIwT5tevUHT4gcRVgh+k024rmLt/Vw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/SaVQ/FEatmYsbCLSFAHGaK7XTTn4wX+u8emNvc9CqwuDuaoAA
	DJDRFa8X9ihDgAs68rrk8cjCUDrsx3/aU8NC0xbAMr6Fu68nG6cHidQZ5xrpu7j1fty8NekAnuB
	0EaBH1fMyz982hdjppmB47t+6ibcVGmQ=
X-Gm-Gg: AZFdTZdvduG7BPhQjFRCh+o29wDV7SmW8QTmW7fqkTdiqxgQStT76ghayZwWU/wEPyt
	SP6kYYoWDPYAplqR7AGpc202OHIp+43ivKTz3sEpzwmRRfKgL6D57HaC61iAEr+rj6SxMDlMaQX
	hhXsZFLRrAbejvdK1bih3ZgV0Sr9zcA+8gZpB7jGZueKT7zM8vuC2+PvzOIq4rJAT7a0Hhmffio
	eTQav3SEzdLKf/oqBAaLRanV8nep6BVatKgP6uBLm/uC2cHgFq4tjNfG5hJ79k/HcN73ZhuIXJn
	+uqFPIn8HL6ZZHqfDD3a8GXKJVUIRL4+zwXTpb+L/4uKU4Mmd9VTAqEOXb9RPYEVxXN6TQ0tsyV
	6yRxImLj5eT0krY8rasZzBIIF7Io4UMpMrD2nqCbyffdGF+/Rl7K9dbxLpg0NVTvVNmP4wBW6Jw
	7+Zq2GCJssl/uDEd3jz6dTIOVFRsBeJLeGdr95O/1zlepj7IKCDySaJGwTHOJ10HQ6VBlL690dn
	GJ0LTZ4krpeL0s3U5BLz2l8D6Zasg==
X-Received: by 2002:a05:6122:1d06:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ee8af5443bmr1845996e0c.20.1795196028572; Fri, 20 Nov 2026
 09:33:48 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <20261119144848.4ddd88cb@kernel.org> <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
 <20261119161151.5251fc86@kernel.org>
In-Reply-To: <20261119161151.5251fc86@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 10:33:37 -0700
X-Gm-Features: Aa3M54rQjy3WuSYK7qM4qXKPc456YWlaTnH7_OIMqG9iK55grQSbT34CyqfskX4
Message-ID: <CADvTj4o_hBYRzpQVvAcyP6MfYjpjy84iGxwoeDN59eVTbKszAA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 19 Nov 2026 16:32:58 -0700 James Hilliard wrote:
> > Would it make sense to address the `rx on` drops in a separate
> > follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
> > would mean enabling error forwarding to DMA and passing packets whose
> > only error is an IP or transport checksum up as CHECKSUM_NONE, while
> > still discarding frames with a bad FCS or other fatal RX errors.
> >
> > If we leave the checker enabled in both modes, `rx off` would only
> > control whether the driver reports a checksum as verified. In that
> > form the follow-up would replace the conditional bit-27 write rather
> > than depend on this patch.
>
> I'm not very clear on the changes needed to get to "bad L4 csum packets
> still reach the stack" / correct behavior. Would you be willing to
> sketch the full series out already, and then we decide what gets
> applied where?

I posted the two-patch series [0]. The first patch fixes RX checksum
handling in both ethtool modes. The second adds rx-all support.

> What I would like to avoid is us applying this fix to net (which
> seems legitimate on the surface), but then following up with another
> fix which unconditionally clears EMAC_RX_DO_CRC since AFAIU we
> need to clear it for the correct behavior.

We don't need to clear EMAC_RX_DO_CRC. On H616 I verified that setting
RX_ERR_FRM lets packets with a bad UDP checksum reach DMA while
EMAC_RX_DO_CRC is still set. The descriptor flags the checksum error,
so the driver can pass the packet up as CHECKSUM_NONE while still
dropping frames with a bad FCS by default.

The new series keeps EMAC_RX_DO_CRC set in both modes. It replaces
the conditional write in this patch, so there's no need to apply this
patch to net first.

[0] https://lore.kernel.org/r/20261120-submit-sun8i-rx-features-v1-v1-0-505=
8fecba6b3@gmail.com/
