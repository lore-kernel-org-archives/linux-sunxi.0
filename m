Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE321328DB
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jun 2024 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981147; cv=none; b=Pz3GRFJCUTxRZGFHBH/idwOcUak36sSnctU1lMaj3rPR++jZE9OIEx5ELjp/Dsdwt5LKOk5LOsXEPcI0lAt04A2A5tboCyRzWQwA/9VcZ4XYkTAB9I+GJAI5LPEArIq5zCq4HIQttEPZbdCTtxLIMi0SMo2MY2Wm1qo3HciCVHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981147; c=relaxed/simple;
	bh=NxVj40cdOchzrQqEkP4dhiyynqL5T82rHBpo+PoV684=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVD3G+rrvNEGnIRQn5lYAwFFNzoY/Y5vB0IQ4IqHcQ9pIdOVIMmv27egeF/IZgGroM/zGTw7xBsogSsyZyaWFugX/g9SR7FH9FDXI9UgkB5TArewTPw2y3nr8ta4idoT7twxPiPnPDhilxcqUFuB94LLsun4uj5VAZ+RbH66ToM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso18387151fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Jun 2024 07:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718981143; x=1719585943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NxVj40cdOchzrQqEkP4dhiyynqL5T82rHBpo+PoV684=;
        b=V9N7Sz/KALzHgE159oXJabXkqanUmnKeoluxx2g5zu/NY+7Z/ReyBnZlYFjA7Z+tPr
         qUNFOf5Fv6k+ZEu3oaJ8JbAraBW53PwN75IME76OZkc8fj07Lh6/CE0hTFos1jsrvugG
         kqcZ7wf2pa1Ut8+nSNMe75sbIRUhZ2eIXMgF+Zx5RbmUeUeTW3MeSIsttj996eJwKTww
         mrgNB6rSYheLEw3cymREHrXTzAhuvME/SYwtw9fzu/zbWcErDrdcrWmA9ksGszGr1QE4
         8WjTwBuW17I4YuOkL4FKujZlAoto3Zn/K5aCB/1KGPcyhDq1U0U6H7bCdPktEHte/PGn
         eUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+Qp9vZ6SRCUh6Cq7Gkew2z/iYtclDIqudMlWD702JxOqsH25QhP3co+PGXm3bXphIvrAcK7UXmoPvUJFwDj/HFdN2+wgr7f3/SpI=
X-Gm-Message-State: AOJu0YwOFf/0BlkOSwhFuJomPAPkyJnwR5shf3CO1N73NwtwUmCuPnjH
	yxpvygqczj6BcDIToDK0cy3PuwfjJ9KwtxRpMgpAcMrYxbygbcbKFLZGQ/0f
X-Google-Smtp-Source: AGHT+IGxfIvQwSiuvV4Dg9Rkl49pwVFjbcfrRCuIkxlwm0teKR+v0zwTi7UAKC0NkWADIQsd5k/ycQ==
X-Received: by 2002:a2e:a169:0:b0:2ec:4408:56ac with SMTP id 38308e7fff4ca-2ec53abdbf7mr161221fa.17.1718981142593;
        Fri, 21 Jun 2024 07:45:42 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4fd046b9sm1475711fa.119.2024.06.21.07.45.42
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 07:45:42 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec4a35baa7so12522311fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Jun 2024 07:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXABLhBS76nXtDc4pqOPVTrqpO1DKrZf8hjFCcWu2aT2yiEtIF+Aj1D45e6CtRNC8d0OsQZw0FkSTPDnDI9L2nRVQRb5WMHrwA5tZA=
X-Received: by 2002:a2e:9b53:0:b0:2ec:35a3:20bd with SMTP id
 38308e7fff4ca-2ec53afdc03mr148101fa.22.1718981142291; Fri, 21 Jun 2024
 07:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240616220719.26641-1-andre.przywara@arm.com> <20240616220719.26641-4-andre.przywara@arm.com>
In-Reply-To: <20240616220719.26641-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 21 Jun 2024 22:45:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v656egzMQ+YqwZm=Z5QyHzEKGoSOivZxYhzBbq4GGp8mEA@mail.gmail.com>
Message-ID: <CAGb2v656egzMQ+YqwZm=Z5QyHzEKGoSOivZxYhzBbq4GGp8mEA@mail.gmail.com>
Subject: Re: [PATCH 3/4] crypto: sun8i-ce - add Allwinner H616 support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 6:09=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The crypto engine in the Allwinner H616 is very similar to the H6, but
> needs the base address for the task descriptor and the addresses within
> it to be expressed in words, not in bytes.
>
> Add a new variant struct entry for the H616, and set the new flag to
> mark the use of 34 bit addresses. Also the internal 32K oscillator is
> required for TRNG operation, so specify all four clocks.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
