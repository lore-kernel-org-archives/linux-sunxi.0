Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3945181B84
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jun 2024 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718383423; cv=none; b=i5IFb1b05wSCpSawKyrD246OTvhgeAXtHNSfbbtNBKF+LBtcaXr189tSusboHhNiVj3KU8B4jBixF1vErpX5KiVF9v/xKT2cVLyZSqG1HrOhxr3RuF3OiVf8uppIn+Hfo5aUlBMCNSwgTZd5TDrkTpcYcFMyXPDFaHjw4yGvmm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718383423; c=relaxed/simple;
	bh=d5Lvv7h5cpXDk6W/gnDRiwt19RfIXWkkQRdmPaInaso=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uTVPf6AY2YAu3+6QSvs5CWFyp5rz+Y+hvqEFJjQ+oKpQYtLuEB8ihXHXhIL+qXUNCx3+3Zyd2IiqqcVaoU4CYjCxF9JpuhRZk3nc4JPSYk2i7aicIONF7qZAeo8gyzJyYPfGfwh0vm1uFtzwxJvAtvKMBg4a51a7qUhzN+6r/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEiTVzTB; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEiTVzTB"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so2258700a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Jun 2024 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718383420; x=1718988220; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d5Lvv7h5cpXDk6W/gnDRiwt19RfIXWkkQRdmPaInaso=;
        b=lEiTVzTB54fsFehv1TL7m0+Mxisz2rF2y7a5RC3LptzMSoxJyKQsK8FoBPwPQYTJoB
         jNG70HpqKW0XTP15qImoyqkTFM6NqScdOflvZE5jhOO0kD9+YtQ0A87pOlFHBAddCdF0
         oOBFLczIa+kl5KDuSbjw83Q/GcyPOBzyLvCdtY11r0QQuYN7XY/bi7nukQBFIp5C/4vi
         Gj6ZwEd7O7CuN3nMboBiw+Wfyd48xLn6JKrnWHi9inV73onM8oevNSP95EcQVXqMZ8Hk
         KVhXKfVfdszZyMWjZ1TBk5PFz/orUnp1OicB+sLOAganbDapZMG0JMfUfYl7upC/u/SI
         cIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718383420; x=1718988220;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5Lvv7h5cpXDk6W/gnDRiwt19RfIXWkkQRdmPaInaso=;
        b=tsv9eN+lLnc31+dw1WAXu0jGN2I5jlfNEwrXuNj+ynxIhfo0GSS8xGIECDgqL+M4ZB
         F2DVdFsu8FUQCwv/tk+iq4qcfmcDj9koZGbgPR/bc3G4bmptjiy6cMpNeVbYxNEgCajH
         nSdjFw7paOwKn64hUw0IxC43DEccfm4zQi98dOpZlUlM6p5VV4JrqA1QwetukIWa0+xg
         9xcoe9BrRuAx81FjjAU3CjIZRN6tFHdYthVbgDQiTNXgAtzgG7FVhrzixaddYMp9LAac
         WhZkTpYhhfRQelPtTSB6x4VXBnwaU1pNSkAYVQkeLDaDlcM8D6GlCQRQS5q7RejHiHfV
         PrCA==
X-Forwarded-Encrypted: i=1; AJvYcCWpbSydvc8BPjoj6KyTin4D3wDtcaohH6CibWfEHjhIa28UCTsPN8kDzP2h0cPcsIJawf31qQHB0LVUVdJurU62IRbpDmVqyoKrz+A=
X-Gm-Message-State: AOJu0YywCs/NwqKxI/hY6DhtwPCgvb8FxEpxXWz3dvvi/TDv3JD1sH0p
	yn6FInDosiFsZzB24wXXc9TnHB1oY8u47veOALIX+bOwp6ybPgROOwYzhFUzw3nd6t7ZKvg3vlN
	mlzfcYel8Y9tntLUAsoQsBXTNG34=
X-Google-Smtp-Source: AGHT+IGPpkBq28XKJpDdjBk3xqnrBsnQijyAHpYp9bTM7Iv02IbJso4b9IqplKPZDYWKOLAW0VgpylUqyEQ3H7NBal8=
X-Received: by 2002:a05:6402:516:b0:57c:5c50:2ef9 with SMTP id
 4fb4d7f45d1cf-57cb4b9965fmr3884615a12.3.1718383420051; Fri, 14 Jun 2024
 09:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Fri, 14 Jun 2024 18:43:28 +0200
Message-ID: <CADomA48VNZiDPVKrUTq6h8SMBO-GA5HUGXXRRA9jAQnPKyESJg@mail.gmail.com>
Subject: Re: (subset) [PATCH v3] mfd: axp20x: AXP717: Fix missing IRQ status
 registers range
To: lee@kernel.org
Cc: andre.przywara@arm.com, jernej.skrabec@gmail.com, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	macroalpha82@gmail.com, ryan@testtoast.com, 
	Philippe Simons <simons.philippe@gmail.com>, wens@csie.org
Content-Type: text/plain; charset="UTF-8"

Tested on my RG35XX-H, v6.10rc3 boots with the patch applied

Tested-by: Philippe Simons <simons.philippe@gmail.com>
