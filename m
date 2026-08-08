Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B8936212E
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 09:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180739; cv=none; b=uuRBLZ3MQ5cygXI2+YMOwCwv8Rya4eEn60mH9piTL+HW4/wexsSaODSe/Sy5jdJCEkz489IfOcsdy4zF9IZvoFRUbwuZfUKFzIg2IAM3suzTCLXw6qlS/WnnV3xjYdjRyAN0llOLhhAOKs2OynY2SecIPiE1jL+iUgfX6WbVYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180739; c=relaxed/simple;
	bh=VbAAy98TJbuqzglayWT6YZm0NiqTYw5WxARmZPcHOGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tdWIUW0WYjeIpro6aOGuoglTuhZgNdugik0ybMC0KSKJn2sCV3dXCCXSXvWD47zYbKZd+orQi4u39qqJ6+XyIh5HcY0c0BJkPx0Af/a4pO8T9uQ7FCK83wzHocR0FbUjUpdXNolSKiqxfVqlEcoQVkBXI7zuB56uZJ5rDA6XvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ah9tnbr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ah9tnbr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920AE1F000E9;
	Sat,  8 Aug 2026 09:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786180737;
	bh=KNahgiTPd9TnIv9MfxZkGH+Nuqcr+iwN0UhE6kyKS+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ah9tnbr6oVkyhEnfk18H7uHns39QntvTTOppfRVEnuSsCmo8fWr3TeLi7ki0u8Gzr
	 FQPbX0xnJJfzun5b1pnjyprg/HquNqw2I2Vc+69rYmZYCGid/vjm7Xc8V1RVrIYgLE
	 A+LRaZuyj4C4xgwmeUX9RQlh36bpRd9B19PpZPPg1grGDRhUjEia55bAnrzPwsmkI7
	 J9S3U83Iy0AEbrbgqh/a35k9nq0naXIpCt/aByTKu0wVtnGF5tKKSBxJ8lJpHdLkeu
	 zojY0GsjOj4L3bdsY4LG89KXQvEhNa1ONVdf7fZXqV0fRPosp+ES91ESYN8Qv+ndwJ
	 BMZxIgV+7iG/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss: fix autosuspend cleanup during
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260808090121.2718855-1-lgs201920130244@gmail.com>
References: <20260808090121.2718855-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 09:18:56 +0000
Message-Id: <20260808091857.920AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but a kernel panic o=
ccurs due to a NULL pointer dereference when tearing down uninitialized flo=
ws on memory allocation failure.
- [High] This problem wasn't introduced by this patch, but a Use-After-Free=
 of the device struct occurs on asynchronous sysfs device unbind when TFMs =
remain active.
- [High] This problem wasn't introduced by this patch, but the interrupt ha=
ndler reads hardware registers without checking if the device is active, vi=
olating PM subsystem guidelines and risking a bus fault.
--

--- Patch [1]: [PATCH] crypto: sun8i-ss: fix autosuspend cleanup during tea=
rdown ---
commit 75226cf213617a07b13c36d7aa3f2f0e09bc4f0f
Author: Guangshuo Li <lgs201920130244@gmail.com>

crypto: sun8i-ss: fix autosuspend cleanup during teardown

sun8i_ss_pm_init() calls pm_runtime_use_autosuspend(), but the autosuspend
setting is not undone if pm_runtime_set_suspended() fails or when runtime PM
is later torn down by sun8i_ss_pm_exit(). This patch ensures the autosuspend
setting is correctly cleaned up by calling pm_runtime_dont_use_autosuspend(=
).

> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/=
crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> index 59c9bc45ec0f2..775355ac9f9e2 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> @@ -664,14 +664,18 @@ static int sun8i_ss_pm_init(struct sun8i_ss_dev *ss)
>  	pm_runtime_set_autosuspend_delay(ss->dev, 2000);
> =20
>  	err =3D pm_runtime_set_suspended(ss->dev);
> -	if (err)
> +	if (err) {
> +		pm_runtime_dont_use_autosuspend(ss->dev);
>  		return err;
> +	}
> +
>  	pm_runtime_enable(ss->dev);
>  	return err;
>  }
> =20
>  static void sun8i_ss_pm_exit(struct sun8i_ss_dev *ss)
>  {
> +	pm_runtime_dont_use_autosuspend(ss->dev);
>  	pm_runtime_disable(ss->dev);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but a kernel panic occurs due to
a NULL pointer dereference when tearing down uninitialized flows on memory
allocation failure.

If a memory allocation fails inside allocate_flows(), the code jumps to
error_engine without decrementing the loop index i:

drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:allocate_flows() {
    ...
		ss->flows[i].biv =3D devm_kmalloc(ss->dev, AES_BLOCK_SIZE,
						GFP_KERNEL);
		if (!ss->flows[i].biv) {
			err =3D -ENOMEM;
			goto error_engine;
		}
    ...
}

It then executes sun8i_ss_free_flows(ss, i). Because ss->flows was allocated
with devm_kcalloc (zero-initialized), ss->flows[i].engine is still NULL:

drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:sun8i_ss_free_flows() {
static void sun8i_ss_free_flows(struct sun8i_ss_dev *ss, int i)
{
	while (i >=3D 0) {
		crypto_engine_exit(ss->flows[i].engine);
		i--;
	}
}

Will this pass the NULL engine pointer to crypto_engine_exit() and cause a
crash when it is dereferenced?

[Severity: High]
This isn't a bug introduced by this patch, but a use-after-free of the
device struct occurs on asynchronous sysfs device unbind when TFMs remain
active.

During device unbind, sun8i_ss_remove() initiates the teardown without wait=
ing
for active TFMs to be released, allowing devres to free the device structure
early:

drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:sun8i_ss_remove() {
static void sun8i_ss_remove(struct platform_device *pdev)
{
	struct sun8i_ss_dev *ss =3D platform_get_drvdata(pdev);

	sun8i_ss_unregister_algs(ss);
    ...
}

When the user process later closes its socket, does sun8i_ss_cipher_exit()
dereference the already freed op->ss structure?

drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:sun8i_ss_cipher_exit() {
void sun8i_ss_cipher_exit(struct crypto_tfm *tfm)
{
	struct sun8i_cipher_tfm_ctx *op =3D crypto_tfm_ctx(tfm);

	kfree_sensitive(op->key);
	crypto_free_skcipher(op->fallback_tfm);
	pm_runtime_put_sync(op->ss->dev);
}

[Severity: High]
This isn't a bug introduced by this patch, but the interrupt handler reads
hardware registers without checking if the device is active, violating PM
subsystem guidelines and risking a bus fault.

The interrupt handler immediately reads SS_INT_STA_REG upon entry:

drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:ss_irq_handler() {
static irqreturn_t ss_irq_handler(int irq, void *data)
{
	struct sun8i_ss_dev *ss =3D (struct sun8i_ss_dev *)data;
	int flow =3D 0;
	u32 p;

	p =3D readl(ss->base + SS_INT_STA_REG);
    ...
}

If a late or spurious interrupt fires while the device is in the RPM_SUSPEN=
DED
state (with hardware clocks disabled), will this register read fault? Could
pm_runtime_get_if_active() be used before accessing hardware registers to
guarantee power is applied?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808090121.2718=
855-1-lgs201920130244@gmail.com?part=3D1
