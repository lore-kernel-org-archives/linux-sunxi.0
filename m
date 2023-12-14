Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEE06A337
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j59YX3QR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3332efd75c9so7299823f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702582331; x=1703187131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZwA4coKcId6uh+NhWHu2prHRdEVSOKW+sQpZ6upqMM=;
        b=j59YX3QR61TS96aLS3awnJxXC6Vp7xQbhmMAqWpK9f8qvZKHF7hztNftFUYrgHhyXE
         vMCZz1tozUdfOhq1IP8SxJrmsnhWUyda6VGBjhDRm5qyi+bZrSu40m6vmeZWU6BmfeLn
         1aslWOQ1GQ+adit59/Ya1B+8nWfPl7dqoqE5jgr7EsYmnuPGN4OSr4WjozM8n4nC3xfh
         7hbTliBoMQvRdk4uuY1tzb7PB8mziSc6JAhFdEnevctIf2W8TRacDOr08EuGRFGT6ZH1
         eNRycrd7yux6WM1pS899w6SHDbrt6R+BUtSHqZMERsGoqe3nYVwRB0sSS26jgomg7huv
         wN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702582331; x=1703187131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZwA4coKcId6uh+NhWHu2prHRdEVSOKW+sQpZ6upqMM=;
        b=HoSrIaV6AdOrTuP6U0q/r7erkEqZkyh7kCdmZQvv6U1IKPXXaHay8UMQuJ1a0zWG6f
         8KhjTRjXZPlmAtieWvhtNeJ1LOAbn4qmUbuCfroCDxUQM+MKLO235f2F+nHl1agK16lx
         1Vl8Yz/FlM7AoRW19In9JrDNov8NxPk4+hbFvQCqKpqGNJ+MbxIYsXEPrGUd0T2gtCIX
         VpirZtxurAKCIVMCI6hX+ZRixZp+vJOD5VUJK0EgxryeQlaguo55ToiBET6klWZa8l3h
         7aGCyCdFNk2Zspgt2LYrImMTO/qTcOdfR98NQjm/Qqk7VikjCwTgxqrRNfmrmt7yF9x8
         rPog==
X-Gm-Message-State: AOJu0Yy1NI5vqfJwHNFUukmw4rorNJXur6XraYSl0R7uSn81nrOx3ilg
	Wn5vHhffuZhGmgWA6tQTGiQ=
X-Google-Smtp-Source: AGHT+IHtsRk3mvow3KSNtH11+JtzAaTRNz5GbH4j5brmp/1GnWTdRGOSdNUSt5RAhcs8f2RmNTqI2g==
X-Received: by 2002:a5d:69ce:0:b0:336:3ee3:d07 with SMTP id s14-20020a5d69ce000000b003363ee30d07mr762877wrw.119.1702582330895;
        Thu, 14 Dec 2023 11:32:10 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id n6-20020a5d6606000000b00332ff137c29sm16934629wru.79.2023.12.14.11.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 11:32:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>
Subject:
 Re: [PATCH v1 1/1] leds: sun50i-a100: Convert to be agnostic to property
 provider
Date: Thu, 14 Dec 2023 20:32:09 +0100
Message-ID: <12339724.O9o76ZdvQC@archlinux>
In-Reply-To: <20231214192131.1309912-1-andriy.shevchenko@linux.intel.com>
References: <20231214192131.1309912-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, December 14, 2023 8:21:31 PM CET Andy Shevchenko wrote:
> Convert the driver to be agnostic to the property provider.
> LEDS subsytem is not dependent on OF, so no need to make drivers
> be a such.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


