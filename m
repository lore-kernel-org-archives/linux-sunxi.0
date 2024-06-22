Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9222F03
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719079157; cv=none; b=kIr0bV+CNSL7q8nKnNq4fjURAMfPuRT9fFmwei25azymK2zhPwDo2AwNE1BPUSPDn/qOUY3nRllECfzC8ZbTTwHi45H3dE+eUqE4IvT0+3gK0HkLDMgzw5zUWNcMAylHV1OiBKdF2qsiTZuhYGpJm2vhsVO2dWYiHhpfG8oOh78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719079157; c=relaxed/simple;
	bh=0OWr4R6jqv2yBEo8Ss6dcuf/q65Hu16aWbJt9lIsz2Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Es1hQszJ20Xs391j8PXxN6iox3Ivz8DFqEr3VPQ2Kbn7wAFqU0/qwo6mUbwBqo/OL32mAnYcxhYQheB9kXaD7/Kxw13KJjlz9VXvF6fmy7ga+4j1wLvOaNiJyJmwsUrBWsKtVFXw5GYkIciljEWLACgZKzE87azIpZ5wUnaPo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeXI815h; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeXI815h"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso33025641fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719079153; x=1719683953; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0OWr4R6jqv2yBEo8Ss6dcuf/q65Hu16aWbJt9lIsz2Y=;
        b=YeXI815hYOz+LQ/Hlwwj5Te1KlzR67um4mOXYDv7XR/KPTFBi99bXSRv2lGYAZjSL2
         jAwy6siyjJuPb4XLGW4Wh1PbMQRsr9Ceot16yoDjbFFycgGBzofMJ4bw08/+ux2nzfPu
         FpB7SxL6ZobX4NgSPAT0lMo72xyxMuZxXiaDCyH0uSIxLiNefxzd45VQO7eo9E9jBfPu
         cfflU9z+xGCAGiu7rg+8cTj0G/w9sJtRRmsDEvmu1IiVRdDIIrEdVhQ3A5p67tFLe8RN
         cON3HoCkUyi8lbQl6S4beeFEx8qmPtz4ruGqjCB51/do5otry9VN3FkULCZHwlzUJVp6
         M93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719079153; x=1719683953;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OWr4R6jqv2yBEo8Ss6dcuf/q65Hu16aWbJt9lIsz2Y=;
        b=nUaOAypvYsQ6DKXUuS4wrc1U0vrvudm2r6t3N0rObBzZFxWZUJtXL6qjNEXSr4sOZI
         QCVd6pTJyT0jZya+3CsbRFknSoyQ1gWXdsxmHDXxKi1OsKMOIQ3/LdfIKLp8/bOw8ieX
         0IbveQ08KSgRNm8+gE81mtidGmUAt4WAZn4KvHlauUFHH+157Shnwk42t/9KYF2cI9tG
         rnq3uiaEdbob+Uy5iOYJ5WG7S91aFmbdQWz9P0scjQ+HMsPHq3Ek8OB8z6L3GpdncFCs
         kzXs+7mJiB15N3x2xoxtmbrKfNWG8+BTONXBN+I8Fa1mgLMAfCSXVZSJJLL6H92tSQdN
         MwIg==
X-Forwarded-Encrypted: i=1; AJvYcCU4dnGVgoHJ9G7sXbhVaC/5KXpztT+RkENidsFOhAJEw1X4xVNeGr0zH9hgLNXedUHJ43FxwbxqzneTaerd0O+biHjI+zsPk2lmf1c=
X-Gm-Message-State: AOJu0YwOmlKjLCiXsFGfwl7KkVQqdNpdxRqbQkTe7Q5Zs5URvFysNicm
	a5kdnFrfO1A4j7QR9OXJAHl3+Lkkg2csUNgPscVymZL75uaZ+A8snvYWrfwZl3q8pQ7ObYysI8e
	z1kjwgcJ1oIG3eCD1ha4RgaGF4To=
X-Google-Smtp-Source: AGHT+IGieTyaH9Y4odq9IPnMfZ+5C0Od0FwR2MBPc/LXfbNiR/36PtAFy5yt77p/oEReYWsXLeb67mC2IF+cLw++fwE=
X-Received: by 2002:a05:651c:104f:b0:2eb:fb9c:5a85 with SMTP id
 38308e7fff4ca-2ec5940087bmr5791551fa.23.1719079153232; Sat, 22 Jun 2024
 10:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Sat, 22 Jun 2024 19:59:02 +0200
Message-ID: <CADomA4-wVWUzk2nFsgN1RtQJmEAgDk8PhyWmEmVT-V2m56e_SQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] crypto: sun8i-ce: add Allwinner H616 support
To: andre.przywara@arm.com
Cc: clabbe.montjoie@gmail.com, conor+dt@kernel.org, davem@davemloft.net, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org, 
	wens@csie.org
Content-Type: text/plain; charset="UTF-8"

Tested on RG35XX-H (H700), working fine

Tested-by: Philippe Simons <simons.philippe@gmail.com>
