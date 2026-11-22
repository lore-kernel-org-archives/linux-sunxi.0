Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795339013;
	b=mm9yfQKRpV6mJ2qIFlc5NZ/QMpno3H4TFdR5r5xLjSnOBA0bsyz6T68TG4v8rtdenube
	 wsSfw/SYdguLPpoTTD2CfXd0oEPvKlSbeGirHM66M4wl5BavChoNYRSinHdkPprLUPJ8L
	 udYVdRXGZ1rY4VUN4WWiOHCyvWUiWTOGBcOZyqdLEEv2RVVnZv8BXWxFxtKzMFuOXwG2i
	 rI899E6PEzBg6FFOZrjRrConek62LsIGWeBlVhuaoioJspulRjpwJz/irt4NSKtYZyK4j
	 oFjoxVU6IBILciS7Mx6bUH25wjOEEOc9W4vvljO894LD44L4+kyxZ3uSaUxUuMgRt0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
	b=rMm1fEsUCEDWCMOYhR8cA6xX7QYFed86udD461bLC8NYN+B5ZsvGVd7jo47wSO1S46fF
	 LqRXJwMJa2C0SpTrkz4dwR6n1RlI1hakwMstMr6i7kRxOqKVSMT3wsVsE6LdwlT+0JkRZ
	 3OVAg+IUZFB6YnGi5nItm3JrCgrRUOp6mTX20ACkiMDAQxwfg3hJYmwwNq3PgooJuwgy3
	 kPIZnHM9paEtL0IRf539t0Ma7NscHBUVGPbPBoYDV4RYUqppbgO+NWc0lVkSE6dzvUGaZ
	 L5f1UETcnCc29rIA7847IidFNpceLZNfC4ktyk63y7aEGhHAY/jYsS4wCtMaNjmlAmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSGnuEfw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B08606A331
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 09:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B08606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSGnuEfw
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so185782e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 01:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795339011; cv=none;
        d=google.com; s=arc-20260327;
        b=NggK69+IqqKO1gMy5Pabh4zTJdzGljje7z18xnaQWCylLLBwMTChjmgVPrxFOFt2e6
         kwAKuqU78wRjhotavarAh3KDvSJoDeUBBFMM/DxS5WIc9t81alvqPbtIqfGJ7l8dKl34
         VzCuoeQzdAUr/36TkYf0DIQPFrzR5UACy2FL9aQMPZ2xF7zbxeq78bM1N6aGnXFCKE51
         dslbCMrUn8Xm2y71g5Ws0zcMBab+kX1qYgO8RebVpWSNiUu2taY3Xue6rrGeK6ecydVP
         bYW9QKhG9NXf0XJp5J9AZc8e0otJ7+u3QqEI5kkv66L4peLB4CLESuIW696DKO+L0Lwk
         8Nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        fh=g/Ddk9n4z1H+gipAKw42RaiQ9Xh7PLNxL4qwl7lX1L4=;
        b=JDw+noTZ91VpMnb2DlLxTEz/g6adkXB7gTHx685SiBQRxdLoc9Dg3dRrxeA4TlKKBY
         rY5tR1lwGiZNcgmMAJJZqp5+zU4CILS2pVIyilAvtHRvDlgpwcP8n500unqdK8E80dAn
         JWFpQjKKR2LG9RhvRECHHpEPug6ohIko03bG30Z5EJ0KQkrf9FUpTa+kGtP42XfUfEkO
         MibU9YrwqX+Jm0BLYky6Smv6iVHcEwZcut/aSFXjGvtlfVTnNXhavtEb8cXy47YM1gh7
         L+cggtd8MywxkbVGPyghMLok0BGecFpX5SgAKNQvQQDB1k5q7cl7yRq5XLUFHunIRGsi
         oxHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339011; x=1795943811; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=OSGnuEfwLrZQ40ctuC81pGZncUHmL2AeBGWE3lOFxZYTVzquawFGaPIa2IdmDoy7w1
         9Vwu4Av3KIa4dRNsgpI08Ce3hu28u0Mc1GqRmy4KLnXyVZ6wBvZmM8Py31wjZd0xlN7g
         h4f8XNMbXM2eBZxzEAqsQhZzGx/4o9SOb1zVeRtNhBAe+P/LktZNfmYAc+rQXIfja3Ct
         nO4Z1XjfZVsPW/nDDp4hDtgXs0fsrSYuMywbKQrkHUOFlSMexI2+95xdzF241a8U0bUE
         KL+LdJBvYy3ut3upLDKmg2wNw8aLgFOOt+3c/ldkCUGlqBdi8w6rztM7MX3CabaLBBWh
         q1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339011; x=1795943811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=wDa5JWJ+FzU+sA3wQAD6kliLTHv39eVttaiqAFBSHzBGt3/hetC/veTzf+Tue/lAJT
         o8ED3s0Wor+hz5rAeS6hfpIOWf6tFd6yh63gATdjxVjKu+KyKGIPDxqGNNyNvWIFhzBW
         bQfQt9esqx+th9xKsGKnEqPByyiDw26EuEvEzXX4ILpcCOzzdS/RjPgq/kcXxlSJ7Uk/
         hp34q20UUtp5AwxQbPRsIKb0vr+MMOcy8fWCK6iLLSLvTPg9S5wdNhLCVGsvliM2sHiy
         yUvVf4B/caWqIHVVYlgtyU8WpCclGIWGmzQ0VrrASD6e3dYihV4aZFnecQlaYp+mszW6
         zN8A==
X-Forwarded-Encrypted: i=1; AL+hErE9NGMieF0n/PiDwIyLLPR1Tu7bYOHgNgVhApJTKwh+4pogYW2+dyhppWDg7rv6JaQaEIRtGjrjuPHgUg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+etSvEMkwnl7YLnbmSATpKQ0nhsV2Ksxf6yKGgek/a/NOF3yuK
	IAp9cL8/0m9V/dZNVGWtbYijwfEkR9AgQC1Snil37LJAFgnRXGJIzRbiL9Vru6EPougKh7vIUSY
	vlduJCPdpvlXkUT7YUbMMlsanIQftklOXunUrz6Q2Wg==
X-Gm-Gg: AZFdTZcqGBK4Bifgi4Oe8TvNIvR/lYv00F5kBwuyR6DXZa/TlJG/97geYeAkX9siJ+9
	HdCIC7RMGPfid6kQaJYkEJEwsvnOe2veBkJDUhhceDX3n4J06RbTS+RmBYZtdb6ftXy+dDmxbFT
	XMcobh1OgMEDDKp6oHGsdcu70XTjPvRGCFNRez4m+99LYFzeQZp+VhWTY+JdYaTbYy5ZrbK6671
	eCpXMKHdDjzNmyH3xCmlGfeAtMOxmDe8lxJvLiOl772qYE50ENzkIPGyy5qmWHfv4bFN5B+eshx
	tmX9r7xgFcoufeOc0MagCbKc/Lja7Fm/hrMjZnuJxsJSUPtDZCSoHjFRb8h42oejwtpi++m/WVI
	HJwr+YyKYuAjEs3FN/Ujvvoczyjx0EEsItG+WbxBxDjGarkSdQeAVk9/dlMPcu279o5WGI0s=
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1bc935c91mr2187197e87.6.1795339010786; Sun, 22 Nov 2026
 01:16:50 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com>
 <20261119-b4-cedrus-mpeg1-v1-2-aa5ba1192822@gmail.com> <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
In-Reply-To: <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:16:39 -0800
X-Gm-Features: Aa3M54oE-VNyvNZaxxRREWe_L_ECyiIpVpQf2rmUEBWZs2-DphbG3Q0KscfmLqc
Message-ID: <CAEy9hNVXZvfbW6U=Y7aiONidPKee7npGWpWuR2yQOeUu4aOVfg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_RFC_2=2F2=5D_media=3A_cedrus=3A_mpeg2=3A_decode_M?=
	=?UTF-8?Q?PEG=2D1_as_V4L2=5FPIX=5FFMT=5FMPEG1=5FSLICE?=
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mripard@kernel.org, paulk@sys-base.io, 
	gregkh@linuxfoundation.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, jonas@kwiboo.se, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, ckoever@outlook.de
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 08:08:50 -0500, Nicolas Dufresne wrote:
> MPEG2 requires MPEG1 support. The new format simply add noise, you can
> fix cedrus with V4L2_MPEG2_SEQ_FLAG_MPEG1 alone.

Thanks, done in v2: the format is gone and cedrus selects MPEG-1 from
V4L2_MPEG2_SEQ_FLAG_MPEG1.
https://lore.kernel.org/r/20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com
