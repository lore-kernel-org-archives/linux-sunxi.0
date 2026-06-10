Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EB3331EC7
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jun 2026 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128891; cv=pass; b=YxTF2KMhm4Gu09FU+kj8nKZ87SScwoznPClVagKqY0IHKYhtgE19CoAXmUL5o7wfFvQMGpFO2Bgw5INvUSJVSNqxRsN/cb8lNwDvCxqH+AWhf51Sl4E31CjDkow9uYFuM4aqcE6gQDTeR18dK9/QFwj2r0ctWobzdaRHX3EpFlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128891; c=relaxed/simple;
	bh=IsdSQKv7tgAjlb47q049+cE+VaLyC2eCAZsAHaGva50=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kEx+ZVQsuET/nvOTvs3H/HySVLgMBQhft4Frw7aSOtQjpGHumtxsXkb3WGQOeCs3DYzzanaXYABWiyegjSl3JY1feBRcxW+/jSgDgjmAzb3wZ3DMyLZS5lvK33VC5cUw2puXX4CMcmLERcc4lB0FUZ0HaO+CZbYfparEryHbeyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4HUi5It; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4HUi5It"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2d792c8so48828935ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jun 2026 15:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781128890; cv=none;
        d=google.com; s=arc-20240605;
        b=hB8PqMTS6LfQdJOXnPdGCFpYcfiL3hGIkWwPV9iRVWmZJrDWPHTkM9OXFQamg+wLof
         i1AlDYDLUSG9fKKliGihGWizisCCOuMhgR71u3HBMXCCREBJrSfUZiVnGFZtbkunGB0g
         JuhHJipJ5NU9qypkwF1ue2fLpPvKByGlYlqvLUUIV1M5Z4Di1TZI0bDKorYqF743XmWf
         2R4gIxLRtXvA+zI4D83EcFUJoBtqCVXgq1zBRMsMdkMic5zPj83X40yH+fwzRcyjn398
         pDRcJ/KZSk0rzM8TIBheIvhR+C9846xv1gAqKgwghTqjG8Q34SrI2wMCLcssQHHrV9h/
         rVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=h0Dmle5MeuP1yPXjVcDAVWMlS5lDrlFusVKexEqhKFY=;
        fh=Zb42P79IRl9njn2LUGzzSd1r9UY1Y5RxIvTyRwmvZqI=;
        b=LIL47hzIAnS3K4Y8qdWsgrkwjZTP5gNhYEPU6yM7cHf5lgQyJIBedxW23FXhc8IXGh
         v8LuLZJDHIEudkZUewow1stqdNvg8x/mWqzrmVo2DXljF8hadz0bYONQopRaaLEXRup/
         9x19nVusQz5QJ0bOUO2K90mSKsB2dMAtyJIklXpcVNI1+1TogzPumD/q9KcN85fRBCVK
         Qo60Mc34gLbu8dq1SmiCShzP2j00McvR7Tn/qyDVVXZSA9GH7TOLmAkQZ0/tdsVLVE4L
         YM0WLwFrJLjxEa7Kp9pxnU0YSjTC/c8YiXxVJQGjQi/XQb0/GuTfrMDu1bhp3au4tudw
         +bfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781128890; x=1781733690; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h0Dmle5MeuP1yPXjVcDAVWMlS5lDrlFusVKexEqhKFY=;
        b=f4HUi5Ityw5/O+/ruWBVbpkmHvI+Ecmw9cZMdVeUkEdcQ703MRRjT+vzwFiVPMFTwd
         PWn+sxerlTz0JeCp+1WL9Qx53kFhTin4837/kdvV+5JiJeyu7WWyt6Vxijal+WlE6W9T
         XdtutmBXMfrIjRQT0uzOLVAOCvaCZTjy5AG7+VYKReeQ3ciY2TV4bsIaTu3v3dJ8kxqi
         qPlNYwIKpjwM78tDH4eyQTU6ljr4iOGJO5Gl2NNEKx6zPH2jPDTlY6r6rM5Vdvp3KHD2
         AgAGkmxoWBmM001FP+x2YBePw7QJvQ7jKRUY39r5IrKb5/XXNnV4HVEUua/q6JeCZlDI
         Lu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781128890; x=1781733690;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Dmle5MeuP1yPXjVcDAVWMlS5lDrlFusVKexEqhKFY=;
        b=OvKipojZBhZpaRAUc/H5Cwg0c43Bku0pWJW+0Yn3RadxJ7d6ERxZRkSboHOu0u0bps
         dMbp3xtQsjlQUOA0zQkdDMfB2LS+n8cfA4/rFOfgz+RGbtHCeQJ+/ZkV5dLrokg0ox/0
         minL/+tga1IohjjpheTyRmoCU4hfZuMhMVIzJIfHC3ZR42ZGgChGv9Re0tBI6WIjPCfX
         u+Bh2GFp2J7yE+heMv9pG3BEKjOpALLdxRbSB6AzsME8k4AsSPHsg0f/fF9+5KKUDdDF
         LLD1wHg74snRhIgo9PevNbmmY+C1Ddg+SaFXdoH1ieeUsnr2smveEAxvXuVXXZUqhwhu
         Imjw==
X-Forwarded-Encrypted: i=1; AFNElJ+T9/FR4wR+BIiz1qis0/atdT0jNWLbvS8Urpvc/gRc4pxjP7+EbkB8ehfrAfiX5paa6PddLC85pJUbJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAt9+pU8Gw6KBNfzLJO5YobEgudwh3/Xu99SCxEwfRtg4xnBIG
	lKDkVkkoeL/7cnkHSZumowqGQn5e6ryUFw30M3QAifXwC7j1vPrjn5k7H8LRf+zbuNMwX45+WrO
	hB174dyrzL1rb5ukLOrlWZHiX2NjuQLc=
X-Gm-Gg: Acq92OHr9WlNyyKUJY78in126Gs56IgygSI9iL3y5Jfks0VLGHSxq7PnCPCh2Ymky+y
	rtxTxcYneGMsrBHFu6NLqyRv185E28aWUf2TYW/dfi2ew8uXnIAsbKbZ110VofTxf1211TgOEQI
	Gn13PF2fiduY8qQYlWJGlhP8X5NIVbhQcfZ/gKP90VMyA8VDm5bG3tb4H9r7rMfqIHDZNRxzGB+
	UfPrJj0OOPADBDyaZZvC1m9IWY87EQXlKTlqCQVQ3y/frO6LmZ53trn6M4aXBHscydzzvE6D7eD
	7zPiQ32u1EKxS4Q=
X-Received: by 2002:a17:903:138a:b0:2c0:a9b3:bdc6 with SMTP id
 d9443c01a7336-2c1e80f9214mr284349325ad.30.1781128887315; Wed, 10 Jun 2026
 15:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Enzo <enzo.adriano.code@gmail.com>
Date: Wed, 10 Jun 2026 18:01:15 -0400
X-Gm-Features: AVVi8CfxAHDyBqNO0Ys_rdLGOZmuKmThiL3y1SJyB19d0A7iTcl0mFxuFzIXLu0
Message-ID: <CAHWUu5EzER1mEmMpOeMgQN_ynW0my-TM2UGt808mjEe4dY-vkg@mail.gmail.com>
Subject: sunxi-mmc: A733 IDMAC stuck in descriptor rea
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On A733/SUN60IW2, SDMMC0 works with PIO reads but normal IDMAC does not
fetch the first descriptor.

This is on a Radxa Cubie A7S, testing Linux v7.1-rc6-gabc8d07b0a63.

The failing transfer is a single 8-block CMD18.  After starting IDMAC:

    IDST = 0x00004000
    CHDA = DLBA
    CBDA = 0
    CBCR = 0x400
    BBCR = 0
    descriptor OWN is still set

The descriptor memory is unchanged after syncing for CPU, so this looks
like the controller never reads descriptor word 0.

I have already checked the obvious descriptor/DMA cases: 4K descriptor
size, shifted descriptor/data addresses, descriptor memory below 4G,
coherent vs streaming descriptors, and the normal-IDMAC 64-bit DMA mask
used by the vendor tree.

Is there an A733-specific clock/reset, MBUS/NSI, firewall, or firmware
handoff bit needed before SDMMC0 IDMAC can access memory?

I can send the full boot log and instrumented dmesg if useful.

Thanks for your time,

Enzo Adriano
enzo.adriano.code@gmail.com
